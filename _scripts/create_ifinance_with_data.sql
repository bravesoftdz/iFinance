USE [master]
GO
/****** Object:  Database [iFinance]    Script Date: 7/06/2018 3:40:23 PM ******/
CREATE DATABASE [iFinance] ON  PRIMARY 
( NAME = N'FMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.DEVELOPMENT\MSSQL\DATA\iFinance.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.DEVELOPMENT\MSSQL\DATA\iFinance_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [iFinance] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [iFinance].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [iFinance] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [iFinance] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [iFinance] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [iFinance] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [iFinance] SET ARITHABORT OFF 
GO
ALTER DATABASE [iFinance] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [iFinance] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [iFinance] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [iFinance] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [iFinance] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [iFinance] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [iFinance] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [iFinance] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [iFinance] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [iFinance] SET  DISABLE_BROKER 
GO
ALTER DATABASE [iFinance] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [iFinance] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [iFinance] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [iFinance] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [iFinance] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [iFinance] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [iFinance] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [iFinance] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [iFinance] SET  MULTI_USER 
GO
ALTER DATABASE [iFinance] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [iFinance] SET DB_CHAINING OFF 
GO
USE [iFinance]
GO
/****** Object:  UserDefinedFunction [dbo].[fxn_get_appv_method]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fxn_get_appv_method] 
(
	
)
RETURNS 
@appv_method TABLE 
(
	value char(1),
	display varchar(25)
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	insert @appv_method
	select 'S','Standard'
	union
	select 'T','Thru Text/SMS'
	union
	select 'C','Thru Call'

	RETURN 
END

GO
/****** Object:  UserDefinedFunction [dbo].[fxn_get_int_comp_method]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fxn_get_int_comp_method] 
(
	
)
RETURNS 
@methods TABLE 
(
	value char(1),
	display varchar(25)
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	insert @methods
	select 'F','Fixed'
	union
	select 'D','Diminishing'

	RETURN 
END

GO
/****** Object:  UserDefinedFunction [dbo].[fxn_get_parent_group]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fxn_get_parent_group] 
(

)
RETURNS 
@ParentGroup TABLE 
(
	-- Add the column definitions for the TABLE variable here
	grp_id char(8), 
	grp_name varchar(30),
	par_grp_id char(8),
	top_grp_id char(8)
)
AS
BEGIN
	declare @processgroup table (grp_id char(10))
	declare @tempgroup table (grp_id char(10))
	declare @cnt integer = 1

	-- insert the parent
	insert 
	  into @parentgroup
	select grp_id,
	       grp_name,
	       grp_id,
		   grp_id
	  from [Group] G
	 where isnull(G.par_grp_id,'') = ''

	-- start with the parent groups
	insert 
	  into @processgroup
	select grp_id 
	  from [Group] (nolock) 
	 where par_grp_id is null
    
	-- iterate until no more children remain
	while @cnt > 0
	begin
		  select @cnt = count(*) 
			from [Group] G (nolock)
		   where par_grp_id in (select grp_id from @processgroup)
			 and grp_id not in (select grp_id from @parentgroup)

		  if @cnt > 0 
		  begin
				insert into @tempgroup
				 select G.grp_id
				   from [Group] G 
			  left join @parentgroup P
					 on P.grp_id = G.grp_id
				  where G.par_grp_id in (select grp_id from @processgroup)
					and isnull(G.par_grp_id,'') <> ''

				 insert into @parentgroup
				 select G.grp_id,
				        G.grp_name,
				        G.par_grp_id,
						coalesce(P.par_grp_id,G.par_grp_id)
				   from [Group] G 
			  left join @parentgroup P
					 on P.grp_id = G.par_grp_id
				  where G.par_grp_id in (select grp_id from @processgroup)
					and isnull(G.par_grp_id,'') <> ''
		  end

		  delete @processgroup
		  
		  insert @processgroup
		  select *
		    from @tempgroup

		  delete @tempgroup
	end

	RETURN 
END

GO
/****** Object:  UserDefinedFunction [dbo].[fxn_get_pay_freq]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fxn_get_pay_freq] 
(
	
)
RETURNS 
@payment_frequency TABLE 
(
	value char(1),
	display varchar(25)
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	insert @payment_frequency
	select 'D','Daily'
	union
	select 'W','Weekly'
	union
	select 'M','Monthly'
	union
	select 'F','Semi-monthly'
	union
	select 'Y','Yearly'
	union
	select 'R','Semi-yearly'
	
	RETURN 
END

GO
/****** Object:  UserDefinedFunction [dbo].[fxn_get_recommendation]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fxn_get_recommendation] 
(
	
)
RETURNS 
@recommendation TABLE 
(
	value int,
	display varchar(25)
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	insert @recommendation
	select 0,'Approve'
	union
	select 1,'Reject'
	
	RETURN 
END

GO
/****** Object:  UserDefinedFunction [dbo].[fxn_get_release_method]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[fxn_get_release_method] 
(
	
)
RETURNS 
@appv_method TABLE 
(
	value char(1),
	display varchar(25)
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	insert @appv_method
	select 'C','Cash'
	union
	select 'D','Card'
	
	RETURN 
END


GO
/****** Object:  UserDefinedFunction [dbo].[udf_format_currency]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[udf_format_currency]
(
	@value decimal(10,2)
)
RETURNS varchar(12)
AS
BEGIN
	return case when isnull(@value,0) = 0 then '-' else convert(varchar,convert(money,@value),1) end
END

GO
/****** Object:  UserDefinedFunction [dbo].[udf_format_date]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[udf_format_date]
(
	@date datetime
)
RETURNS varchar(10)
AS
BEGIN
	return case when @date is null then '-' else convert(varchar(10),@date,101) end
END

GO
/****** Object:  Table [dbo].[AcctInfo]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AcctInfo](
	[acct_no] [varchar](15) NOT NULL,
	[entity_id] [char](10) NOT NULL,
	[bank_id] [char](8) NOT NULL,
	[card_no] [varchar](15) NULL,
	[card_expiry] [datetime] NULL,
 CONSTRAINT [PK_AcctInfo] PRIMARY KEY CLUSTERED 
(
	[acct_no] ASC,
	[entity_id] ASC,
	[bank_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AddressInfo]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AddressInfo](
	[entity_id] [char](10) NOT NULL,
	[st] [varchar](50) NULL,
	[brgy] [varchar](50) NULL,
	[post_code] [smallint] NULL,
	[res_status] [char](1) NULL,
	[landlord] [char](10) NULL,
	[is_prov] [smallint] NOT NULL CONSTRAINT [DF_AddressInfo_is_prov]  DEFAULT ((0)),
 CONSTRAINT [PK_AddressInfo] PRIMARY KEY CLUSTERED 
(
	[entity_id] ASC,
	[is_prov] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bank](
	[bank_id] [char](8) NOT NULL,
	[bank_code] [char](5) NOT NULL,
	[branch] [varchar](50) NOT NULL,
	[loc_code] [char](3) NOT NULL,
 CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED 
(
	[bank_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BankWithdrawal]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankWithdrawal](
	[wd_id] [varchar](17) NOT NULL,
	[wd_date] [datetime] NOT NULL,
	[acct_no] [varchar](15) NOT NULL,
	[wd_amt] [decimal](10, 2) NOT NULL,
	[wd_status_id] [smallint] NOT NULL,
	[date_claimed] [datetime] NULL,
 CONSTRAINT [PK_BankWithdrawal] PRIMARY KEY CLUSTERED 
(
	[wd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Check]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Check](
	[payment_id] [char](15) NOT NULL,
	[check_no] [varchar](15) NOT NULL,
	[check_amt] [decimal](10, 2) NOT NULL,
	[bank_code] [char](5) NOT NULL,
 CONSTRAINT [PK_Check] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Competitor]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Competitor](
	[comp_id] [char](8) NOT NULL,
	[comp_name] [varchar](30) NOT NULL,
	[loc_code] [char](3) NOT NULL,
 CONSTRAINT [PK_Competitor] PRIMARY KEY CLUSTERED 
(
	[comp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContactInfo]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactInfo](
	[entity_id] [char](10) NOT NULL,
	[email_add] [varchar](30) NULL,
	[fb_acct] [varchar](50) NULL,
	[mobile_no] [char](12) NULL,
	[home_phone] [char](12) NULL,
 CONSTRAINT [PK_ContactInfo] PRIMARY KEY CLUSTERED 
(
	[entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmplInfo]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmplInfo](
	[entity_id] [char](10) NOT NULL,
	[emp_id] [char](8) NULL CONSTRAINT [DF_EmplInfo_empl_no]  DEFAULT ((0)),
	[emp_status] [char](1) NULL,
	[date_from] [date] NULL,
	[date_until] [date] NULL,
	[gross_pay] [decimal](8, 2) NULL,
	[serv_len] [smallint] NULL,
	[imm_head] [char](10) NULL,
	[net_pay] [decimal](8, 2) NULL,
	[des_id] [int] NULL,
 CONSTRAINT [PK_EmplInfo] PRIMARY KEY CLUSTERED 
(
	[entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employer]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employer](
	[emp_id] [char](8) NOT NULL,
	[emp_name] [varchar](50) NOT NULL,
	[grp_id] [char](8) NOT NULL,
	[loc_code] [char](3) NOT NULL,
	[emp_add] [varchar](50) NULL,
 CONSTRAINT [PK_Employer] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Entity]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Entity](
	[entity_id] [char](10) NOT NULL,
	[entity_type] [char](2) NOT NULL CONSTRAINT [DF_Entity_entity_type]  DEFAULT ('CL'),
	[ref_entity_id] [char](10) NULL,
	[created_date] [datetime] NULL,
	[created_by] [varchar](12) NULL,
	[loc_code] [char](3) NOT NULL,
	[photo] [varchar](25) NULL,
 CONSTRAINT [PK_Entity] PRIMARY KEY CLUSTERED 
(
	[entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EntityGroup]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EntityGroup](
	[entity_id] [char](10) NOT NULL,
	[grp_id] [char](8) NOT NULL,
 CONSTRAINT [PK_EntityLoanClass] PRIMARY KEY CLUSTERED 
(
	[entity_id] ASC,
	[grp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EntityPromissoryNote]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EntityPromissoryNote](
	[entity_id] [char](10) NOT NULL,
	[pn_no] [varchar](15) NOT NULL,
 CONSTRAINT [PK_EntityPromisoryNote] PRIMARY KEY CLUSTERED 
(
	[entity_id] ASC,
	[pn_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpenseInfo]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpenseInfo](
	[loan_id] [char](13) NOT NULL,
	[expense_type] [char](3) NOT NULL,
	[amount] [decimal](8, 2) NOT NULL,
 CONSTRAINT [PK_ExpenseInfo] PRIMARY KEY CLUSTERED 
(
	[loan_id] ASC,
	[expense_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Group]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Group](
	[grp_id] [char](8) NOT NULL,
	[grp_name] [varchar](30) NOT NULL,
	[is_active] [tinyint] NOT NULL CONSTRAINT [DF_EmpGroup_is_active]  DEFAULT ((1)),
	[par_grp_id] [char](8) NULL,
	[loc_code] [char](3) NOT NULL,
 CONSTRAINT [PK_EmpGroup] PRIMARY KEY CLUSTERED 
(
	[grp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GroupAttribute]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GroupAttribute](
	[grp_id] [char](8) NOT NULL,
	[max_tot_amt] [decimal](10, 2) NOT NULL,
	[loan_type] [smallint] NOT NULL,
	[concurrent] [tinyint] NULL,
	[is_gov] [tinyint] NOT NULL CONSTRAINT [DF_GroupAttribute_is_gov]  DEFAULT ((0)),
	[ident_docs] [tinyint] NULL CONSTRAINT [DF_GroupAttribute_ident_docs]  DEFAULT ((0)),
 CONSTRAINT [PK_GroupAttribute] PRIMARY KEY CLUSTERED 
(
	[grp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IdentityInfo]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IdentityInfo](
	[entity_id] [char](10) NOT NULL,
	[ident_type] [char](2) NOT NULL,
	[ident_no] [varchar](15) NOT NULL,
	[exp_date] [datetime] NULL,
 CONSTRAINT [PK_IdentityInfo] PRIMARY KEY CLUSTERED 
(
	[entity_id] ASC,
	[ident_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Interest]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Interest](
	[interest_id] [char](15) NOT NULL,
	[loan_id] [char](13) NOT NULL,
	[interest_date] [datetime] NOT NULL,
	[interest_amt] [decimal](10, 2) NOT NULL,
	[interest_src] [char](3) NOT NULL,
	[interest_status_id] [char](1) NOT NULL,
 CONSTRAINT [PK_Interest] PRIMARY KEY CLUSTERED 
(
	[interest_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ledger]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ledger](
	[posting_id] [varchar](15) NOT NULL,
	[loc_prefix] [varchar](15) NOT NULL,
	[ref_posting_id] [varchar](15) NULL,
	[debit_amt] [decimal](10, 2) NULL,
	[credit_amt] [decimal](10, 2) NULL,
	[event_object] [char](3) NOT NULL,
	[pk_event_object] [varchar](25) NOT NULL,
	[case_type] [char](3) NULL,
	[post_date] [datetime] NOT NULL,
	[value_date] [datetime] NOT NULL,
	[status_code] [char](3) NOT NULL,
 CONSTRAINT [PK_Ledger] PRIMARY KEY CLUSTERED 
(
	[posting_id] ASC,
	[loc_prefix] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Loan]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Loan](
	[loan_id] [char](13) NOT NULL,
	[date_appl] [datetime] NOT NULL,
	[amt_appl] [decimal](10, 2) NOT NULL,
	[des_term] [smallint] NOT NULL,
	[class_id] [int] NOT NULL,
	[purp_id] [int] NULL,
	[entity_id] [char](10) NOT NULL,
	[orig_branch] [char](3) NOT NULL,
	[status_id] [char](1) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[created_by] [varchar](12) NOT NULL,
	[loc_code] [char](3) NULL,
	[balance] [decimal](10, 2) NOT NULL,
	[last_trans_date] [datetime] NULL,
	[pn_no] [varchar](15) NULL,
	[prc_deficit] [decimal](10, 2) NOT NULL,
	[int_deficit] [decimal](10, 2) NOT NULL,
	[amort] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Loan] PRIMARY KEY CLUSTERED 
(
	[loan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoanAppv]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoanAppv](
	[loan_id] [char](13) NOT NULL,
	[amt_appv] [decimal](10, 2) NOT NULL,
	[date_appv] [datetime] NOT NULL,
	[appv_by] [varchar](12) NOT NULL,
	[terms] [smallint] NOT NULL,
	[appv_method] [char](1) NOT NULL,
	[remarks] [varchar](100) NULL,
	[created_date] [datetime] NOT NULL,
	[created_by] [varchar](12) NOT NULL,
 CONSTRAINT [PK_LoanAppv] PRIMARY KEY CLUSTERED 
(
	[loan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoanAss]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoanAss](
	[loan_id] [char](13) NOT NULL,
	[rec_code] [tinyint] NOT NULL,
	[rec_amt] [decimal](10, 2) NULL,
	[date_ass] [datetime] NOT NULL,
	[ass_by] [varchar](12) NOT NULL,
	[capacity] [varchar](200) NULL,
	[character] [varchar](200) NULL,
	[capital] [varchar](200) NULL,
	[conditions] [varchar](200) NULL,
	[collateral] [varchar](200) NULL,
	[comaker] [varchar](200) NULL,
	[created_date] [datetime] NOT NULL,
	[created_by] [varchar](12) NOT NULL,
 CONSTRAINT [PK_LoanAss] PRIMARY KEY CLUSTERED 
(
	[loan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoanAssFinInfo]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoanAssFinInfo](
	[loan_id] [char](13) NOT NULL,
	[comp_id] [char](8) NOT NULL,
	[mon_due] [decimal](10, 2) NOT NULL,
	[loan_bal] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_LoanAssFinInfo] PRIMARY KEY CLUSTERED 
(
	[loan_id] ASC,
	[comp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoanAssMonExp]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoanAssMonExp](
	[loan_id] [char](13) NOT NULL,
	[exp_type] [char](2) NOT NULL,
	[monthly] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_LoanAssMonExp] PRIMARY KEY CLUSTERED 
(
	[loan_id] ASC,
	[exp_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoanCancel]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoanCancel](
	[loan_id] [char](13) NOT NULL,
	[cancelled_date] [datetime] NOT NULL,
	[cancelled_by] [varchar](12) NOT NULL,
	[reason_id] [smallint] NOT NULL,
	[remarks] [varchar](100) NULL,
 CONSTRAINT [PK_LoanCancel] PRIMARY KEY CLUSTERED 
(
	[loan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoanCharge]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoanCharge](
	[loan_id] [char](13) NOT NULL,
	[charge_type] [char](2) NOT NULL,
	[charge_amt] [decimal](10, 2) NULL,
 CONSTRAINT [PK_LoanCharge] PRIMARY KEY CLUSTERED 
(
	[loan_id] ASC,
	[charge_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoanClass]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoanClass](
	[class_id] [int] NOT NULL,
	[grp_id] [char](8) NOT NULL,
	[class_name] [varchar](25) NULL,
	[int_rate] [float] NOT NULL,
	[term] [tinyint] NULL,
	[comakers_min] [tinyint] NULL CONSTRAINT [DF_LoanClass_comakers]  DEFAULT ((0)),
	[comakers_max] [tinyint] NULL CONSTRAINT [DF_LoanClass_comakers_max]  DEFAULT ((0)),
	[int_comp_method] [char](1) NOT NULL,
	[max_loan] [decimal](10, 2) NULL,
	[valid_from] [datetime] NULL,
	[valid_until] [datetime] NULL,
	[loc_code] [char](3) NULL,
	[pay_freq] [char](1) NOT NULL CONSTRAINT [DF_LoanClass_pay_freq]  DEFAULT ('F'),
	[max_age] [tinyint] NULL,
	[dim_type] [smallint] NULL CONSTRAINT [DF_LoanClass_is_fixed]  DEFAULT ((1)),
	[max_advance_pmt] [decimal](10, 2) NULL,
 CONSTRAINT [PK_LoanClass] PRIMARY KEY CLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoanClassAdvance]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanClassAdvance](
	[class_id] [int] NOT NULL,
	[int] [smallint] NULL CONSTRAINT [DF_LoanClassAdvance_int]  DEFAULT ((0)),
	[principal] [smallint] NULL CONSTRAINT [DF_LoanClassAdvance_principal]  DEFAULT ((0)),
	[advance_method] [smallint] NOT NULL CONSTRAINT [DF_LoanClassAdvance_advance_method]  DEFAULT ((0)),
	[include_principal] [bit] NOT NULL CONSTRAINT [DF_LoanClassAdvance_include_principal]  DEFAULT ((0)),
 CONSTRAINT [PK_LoanClassAdvance] PRIMARY KEY CLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoanClassCharge]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoanClassCharge](
	[class_id] [int] NOT NULL,
	[charge_type] [char](2) NOT NULL,
	[charge_value] [decimal](8, 2) NOT NULL,
	[value_type] [tinyint] NOT NULL,
	[ratio_amt] [decimal](8, 2) NULL,
	[max_value] [decimal](8, 2) NULL,
	[max_value_type] [tinyint] NULL CONSTRAINT [DF_LoanClassCharge_max_value_type]  DEFAULT ((0)),
	[for_new] [tinyint] NOT NULL CONSTRAINT [DF_LoanClassCharge_for_new]  DEFAULT ((0)),
	[for_renew] [tinyint] NOT NULL CONSTRAINT [DF_LoanClassCharge_for_renew]  DEFAULT ((0)),
	[for_reloan] [tinyint] NOT NULL CONSTRAINT [DF_LoanClassCharge_for_reloan]  DEFAULT ((0)),
	[for_restructure] [tinyint] NOT NULL CONSTRAINT [DF_LoanClassCharge_for_restructure]  DEFAULT ((0)),
 CONSTRAINT [PK_LoanClassCharge] PRIMARY KEY CLUSTERED 
(
	[class_id] ASC,
	[charge_type] ASC,
	[for_new] ASC,
	[for_renew] ASC,
	[for_reloan] ASC,
	[for_restructure] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoanClose]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoanClose](
	[loan_id] [char](13) NOT NULL,
	[date_closed] [datetime] NOT NULL,
	[closed_by] [varchar](12) NOT NULL,
	[remarks] [varchar](100) NULL,
	[reason_id] [smallint] NOT NULL,
 CONSTRAINT [PK_LoanClose] PRIMARY KEY CLUSTERED 
(
	[loan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoanComaker]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoanComaker](
	[loan_id] [char](13) NOT NULL,
	[entity_id] [char](10) NOT NULL,
 CONSTRAINT [PK_LoanComaker] PRIMARY KEY CLUSTERED 
(
	[loan_id] ASC,
	[entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoanReject]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoanReject](
	[loan_id] [char](13) NOT NULL,
	[date_rejected] [datetime] NOT NULL,
	[rejected_by] [varchar](12) NOT NULL,
	[reason_id] [smallint] NOT NULL,
	[remarks] [varchar](100) NULL,
 CONSTRAINT [PK_LoanDen] PRIMARY KEY CLUSTERED 
(
	[loan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoanRelease]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoanRelease](
	[loan_id] [char](13) NOT NULL,
	[recipient] [char](10) NOT NULL,
	[rel_method] [char](1) NOT NULL,
	[rel_amt] [decimal](10, 2) NOT NULL,
	[date_rel] [datetime] NOT NULL,
	[rel_by] [varchar](12) NOT NULL,
	[loc_code] [char](3) NOT NULL,
 CONSTRAINT [PK_LoanRecipient] PRIMARY KEY CLUSTERED 
(
	[loan_id] ASC,
	[recipient] ASC,
	[rel_method] ASC,
	[loc_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Locked]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Locked](
	[event_object] [char](3) NULL,
	[pk_event_object] [char](15) NULL,
	[user_id] [varchar](12) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payment](
	[payment_id] [char](15) NOT NULL,
	[receipt_no] [char](10) NULL,
	[payment_date] [datetime] NOT NULL,
	[entity_id] [char](10) NOT NULL,
	[loc_code] [char](3) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[created_by] [varchar](12) NOT NULL,
	[ref_no] [varchar](17) NOT NULL,
	[post_date] [datetime] NULL,
	[wd_id] [varchar](17) NULL,
	[is_advance] [bit] NULL,
	[pmt_method] [tinyint] NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaymentDetail]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentDetail](
	[payment_id] [char](15) NOT NULL,
	[loan_id] [char](13) NOT NULL,
	[payment_amt] [decimal](10, 2) NOT NULL,
	[remarks] [varchar](10) NULL,
	[is_cancelled] [tinyint] NOT NULL,
	[payment_type] [char](3) NOT NULL,
	[balance] [decimal](10, 2) NULL,
 CONSTRAINT [PK_PaymentDetail_1] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC,
	[loan_id] ASC,
	[payment_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PersonalInfo]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PersonalInfo](
	[entity_id] [char](10) NOT NULL,
	[lastname] [varchar](50) NOT NULL,
	[firstname] [varchar](50) NOT NULL,
	[middlename] [varchar](50) NULL,
	[birth_date] [datetime] NULL,
	[gender] [char](1) NULL,
	[civil_status] [char](1) NULL,
	[photo] [varchar](25) NULL,
	[oth_income] [varchar](50) NULL,
	[source_id] [int] NULL,
 CONSTRAINT [PK_PersonalInfo] PRIMARY KEY CLUSTERED 
(
	[entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RefInfo]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RefInfo](
	[entity_id] [char](10) NOT NULL,
	[ref_entity_id] [char](10) NOT NULL,
	[ref_type] [char](2) NOT NULL CONSTRAINT [DF_RefInfo_ref_type]  DEFAULT ('UK'),
	[is_dependent] [tinyint] NOT NULL CONSTRAINT [DF_RefInfo_is_dependent]  DEFAULT ((0)),
	[is_student] [tinyint] NOT NULL CONSTRAINT [DF_RefInfo_is_student]  DEFAULT ((0)),
	[educ_code] [char](1) NULL,
 CONSTRAINT [PK_RefInfo] PRIMARY KEY CLUSTERED 
(
	[entity_id] ASC,
	[ref_entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReLoan]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReLoan](
	[loan_id] [char](13) NOT NULL,
	[new_loan_id] [char](13) NOT NULL,
	[payment_id] [char](15) NOT NULL,
	[is_restructured] [bit] NOT NULL,
 CONSTRAINT [PK_ReLoan] PRIMARY KEY CLUSTERED 
(
	[loan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sequence]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sequence](
	[seq_object] [char](3) NOT NULL,
	[last_id] [int] NOT NULL,
 CONSTRAINT [PK_Sequence] PRIMARY KEY CLUSTERED 
(
	[seq_object] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_AccountType]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_AccountType](
	[acct_type] [smallint] NOT NULL,
	[acct_type_name] [varchar](25) NULL,
	[acct_type_desc] [varchar](100) NULL,
 CONSTRAINT [PK_T_AccountType] PRIMARY KEY CLUSTERED 
(
	[acct_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Bank]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Bank](
	[bank_code] [char](5) NOT NULL,
	[bank_name] [varchar](30) NOT NULL,
 CONSTRAINT [PK_T_Bank_1] PRIMARY KEY CLUSTERED 
(
	[bank_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ChargeType]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ChargeType](
	[charge_type] [char](2) NOT NULL,
	[charge_name] [varchar](25) NOT NULL,
 CONSTRAINT [PK_T_ChargeType] PRIMARY KEY CLUSTERED 
(
	[charge_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Designation]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Designation](
	[des_id] [int] NOT NULL,
	[designation] [varchar](25) NULL,
 CONSTRAINT [PK_T_Designation] PRIMARY KEY CLUSTERED 
(
	[des_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_EntityType]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_EntityType](
	[entity_type] [char](2) NOT NULL,
	[entity_name] [varchar](25) NOT NULL,
	[entity_desc] [varchar](100) NULL,
	[is_active] [smallint] NOT NULL CONSTRAINT [DF_T_Entity_is_valid]  DEFAULT ((1)),
	[is_client] [smallint] NOT NULL CONSTRAINT [DF_T_EntityType_is_client]  DEFAULT ((1)),
	[is_person] [smallint] NOT NULL CONSTRAINT [DF_T_EntityType_is_individual]  DEFAULT ((1)),
 CONSTRAINT [PK_T_Entity] PRIMARY KEY CLUSTERED 
(
	[entity_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ExpenseType]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ExpenseType](
	[exp_type] [char](2) NOT NULL,
	[exp_name] [varchar](30) NOT NULL,
	[exp_desc] [varchar](100) NULL,
 CONSTRAINT [PK_T_Expense] PRIMARY KEY CLUSTERED 
(
	[exp_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_IdentityType]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_IdentityType](
	[ident_type] [char](2) NOT NULL,
	[ident_name] [varchar](25) NOT NULL,
	[ident_desc] [varchar](100) NULL,
	[has_expiry] [tinyint] NOT NULL CONSTRAINT [DF_T_IdentityType_has_expiry]  DEFAULT ((0)),
 CONSTRAINT [PK_T_IdentityType] PRIMARY KEY CLUSTERED 
(
	[ident_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_InfoSource]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_InfoSource](
	[source_id] [int] IDENTITY(1,1) NOT NULL,
	[source_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_T_InfoSource] PRIMARY KEY CLUSTERED 
(
	[source_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_LoanCancelReason]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_LoanCancelReason](
	[reason_id] [smallint] NOT NULL,
	[reason_name] [varchar](50) NOT NULL,
	[reason_desc] [varchar](100) NULL,
 CONSTRAINT [PK_T_LoanCancelReason] PRIMARY KEY CLUSTERED 
(
	[reason_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_LoanCloseReason]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_LoanCloseReason](
	[reason_id] [smallint] NOT NULL,
	[reason_name] [varchar](50) NULL,
	[reason_desc] [varchar](100) NULL,
	[is_system] [bit] NOT NULL CONSTRAINT [DF_T_LoanCloseReason_is_system]  DEFAULT ((0)),
	[is_auto_post] [bit] NOT NULL CONSTRAINT [DF_T_LoanCloseReason_is_sysgen]  DEFAULT ((0)),
 CONSTRAINT [PK_T_LoanCloseReason] PRIMARY KEY CLUSTERED 
(
	[reason_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_LoanRejectReason]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_LoanRejectReason](
	[reason_id] [smallint] NOT NULL,
	[reason_name] [varchar](50) NOT NULL,
	[reason_desc] [varchar](100) NULL,
 CONSTRAINT [PK_T_LoanRejectReason] PRIMARY KEY CLUSTERED 
(
	[reason_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_LoanStatus]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_LoanStatus](
	[status_id] [char](1) NOT NULL,
	[status_name] [varchar](30) NOT NULL,
	[status_desc] [varchar](100) NULL,
	[is_active] [tinyint] NOT NULL CONSTRAINT [DF_T_LoanStatus_is_active]  DEFAULT ((1)),
 CONSTRAINT [PK_T_LoanStatus] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_LoanType]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_LoanType](
	[loan_type] [smallint] NOT NULL,
	[acct_type] [smallint] NOT NULL,
	[loan_type_name] [varchar](25) NOT NULL,
	[loan_type_desc] [varchar](100) NULL,
	[max_concurrent] [tinyint] NOT NULL CONSTRAINT [DF_T_LoanType_max_concurrent]  DEFAULT ((0)),
	[max_tot_amt] [decimal](10, 2) NOT NULL CONSTRAINT [DF_T_LoanType_max_tot_amt]  DEFAULT ((0)),
	[ident_docs] [tinyint] NOT NULL CONSTRAINT [DF_T_LoanType_ident_docs]  DEFAULT ((0)),
 CONSTRAINT [PK_T_LoanType] PRIMARY KEY CLUSTERED 
(
	[loan_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_PaymentMethod]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_PaymentMethod](
	[pmt_method] [tinyint] NOT NULL,
	[pmt_method_name] [varchar](25) NOT NULL,
	[pmt_method_desc] [varchar](100) NULL,
	[pmt_charge] [decimal](8, 2) NULL,
 CONSTRAINT [PK_T_PaymentMethod] PRIMARY KEY CLUSTERED 
(
	[pmt_method] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Province]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Province](
	[area_code] [smallint] NOT NULL,
	[province] [varchar](30) NOT NULL,
 CONSTRAINT [PK_T_Province] PRIMARY KEY CLUSTERED 
(
	[area_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Purpose]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Purpose](
	[purp_id] [int] NOT NULL,
	[purpose] [varchar](25) NULL,
 CONSTRAINT [PK_T_Purpose] PRIMARY KEY CLUSTERED 
(
	[purp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ReferenceType]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ReferenceType](
	[ref_type] [char](2) NOT NULL,
	[ref_name] [varchar](25) NOT NULL,
	[ref_desc] [varchar](100) NULL,
	[is_family] [tinyint] NOT NULL CONSTRAINT [DF_T_ReferenceType_is_family]  DEFAULT ((0)),
	[max] [tinyint] NOT NULL CONSTRAINT [DF_T_ReferenceType_max]  DEFAULT ((0)),
 CONSTRAINT [PK_T_Reference] PRIMARY KEY CLUSTERED 
(
	[ref_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Town]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Town](
	[post_code] [smallint] NOT NULL,
	[town] [varchar](25) NOT NULL,
	[area_code] [smallint] NOT NULL,
	[is_active] [tinyint] NOT NULL CONSTRAINT [DF_T_Town_is_active]  DEFAULT ((1)),
 CONSTRAINT [PK_T_Town] PRIMARY KEY CLUSTERED 
(
	[post_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Loan]    Script Date: 7/06/2018 3:40:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Loan] ON [dbo].[Loan]
(
	[loan_id] ASC,
	[pn_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BankWithdrawal] ADD  CONSTRAINT [DF_BankWithdrawal_wd_status_id]  DEFAULT ((0)) FOR [wd_status_id]
GO
ALTER TABLE [dbo].[Interest] ADD  CONSTRAINT [DF_Interest_interest_src]  DEFAULT ('SYS') FOR [interest_src]
GO
ALTER TABLE [dbo].[Interest] ADD  CONSTRAINT [DF_Interest_interest_status_id]  DEFAULT ('P') FOR [interest_status_id]
GO
ALTER TABLE [dbo].[Ledger] ADD  CONSTRAINT [DF_Ledger_status_code]  DEFAULT ('OPN') FOR [status_code]
GO
ALTER TABLE [dbo].[Loan] ADD  CONSTRAINT [DF_Loan_status_id]  DEFAULT ('P') FOR [status_id]
GO
ALTER TABLE [dbo].[Loan] ADD  CONSTRAINT [DF_Loan_balance]  DEFAULT ((0)) FOR [balance]
GO
ALTER TABLE [dbo].[Loan] ADD  CONSTRAINT [DF_Loan_prc_deficit]  DEFAULT ((0)) FOR [prc_deficit]
GO
ALTER TABLE [dbo].[Loan] ADD  CONSTRAINT [DF_Loan_int_deficit]  DEFAULT ((0)) FOR [int_deficit]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_is_advanced]  DEFAULT ((0)) FOR [is_advance]
GO
ALTER TABLE [dbo].[PaymentDetail] ADD  CONSTRAINT [DF_PaymentDetail_is_cancelled]  DEFAULT ((0)) FOR [is_cancelled]
GO
ALTER TABLE [dbo].[ReLoan] ADD  CONSTRAINT [DF_ReLoan_is_restructured]  DEFAULT ((0)) FOR [is_restructured]
GO
ALTER TABLE [dbo].[AcctInfo]  WITH CHECK ADD  CONSTRAINT [FK_AcctInfo_Bank] FOREIGN KEY([bank_id])
REFERENCES [dbo].[Bank] ([bank_id])
GO
ALTER TABLE [dbo].[AcctInfo] CHECK CONSTRAINT [FK_AcctInfo_Bank]
GO
ALTER TABLE [dbo].[AddressInfo]  WITH CHECK ADD  CONSTRAINT [FK_AddressInfo_Entity] FOREIGN KEY([entity_id])
REFERENCES [dbo].[Entity] ([entity_id])
GO
ALTER TABLE [dbo].[AddressInfo] CHECK CONSTRAINT [FK_AddressInfo_Entity]
GO
ALTER TABLE [dbo].[AddressInfo]  WITH CHECK ADD  CONSTRAINT [FK_AddressInfo_Landlord] FOREIGN KEY([landlord])
REFERENCES [dbo].[Entity] ([entity_id])
GO
ALTER TABLE [dbo].[AddressInfo] CHECK CONSTRAINT [FK_AddressInfo_Landlord]
GO
ALTER TABLE [dbo].[AddressInfo]  WITH CHECK ADD  CONSTRAINT [FK_AddressInfo_T_Town] FOREIGN KEY([post_code])
REFERENCES [dbo].[T_Town] ([post_code])
GO
ALTER TABLE [dbo].[AddressInfo] CHECK CONSTRAINT [FK_AddressInfo_T_Town]
GO
ALTER TABLE [dbo].[BankWithdrawal]  WITH CHECK ADD  CONSTRAINT [FK_BankWithdrawal_BankWithdrawal] FOREIGN KEY([wd_id])
REFERENCES [dbo].[BankWithdrawal] ([wd_id])
GO
ALTER TABLE [dbo].[BankWithdrawal] CHECK CONSTRAINT [FK_BankWithdrawal_BankWithdrawal]
GO
ALTER TABLE [dbo].[Check]  WITH CHECK ADD  CONSTRAINT [FK_Check_Payment] FOREIGN KEY([payment_id])
REFERENCES [dbo].[Payment] ([payment_id])
GO
ALTER TABLE [dbo].[Check] CHECK CONSTRAINT [FK_Check_Payment]
GO
ALTER TABLE [dbo].[Check]  WITH CHECK ADD  CONSTRAINT [FK_Check_T_Bank] FOREIGN KEY([bank_code])
REFERENCES [dbo].[T_Bank] ([bank_code])
GO
ALTER TABLE [dbo].[Check] CHECK CONSTRAINT [FK_Check_T_Bank]
GO
ALTER TABLE [dbo].[ContactInfo]  WITH CHECK ADD  CONSTRAINT [FK_ContactInfo_Entity] FOREIGN KEY([entity_id])
REFERENCES [dbo].[Entity] ([entity_id])
GO
ALTER TABLE [dbo].[ContactInfo] CHECK CONSTRAINT [FK_ContactInfo_Entity]
GO
ALTER TABLE [dbo].[EmplInfo]  WITH CHECK ADD  CONSTRAINT [FK_EmplInfo_Employer] FOREIGN KEY([emp_id])
REFERENCES [dbo].[Employer] ([emp_id])
GO
ALTER TABLE [dbo].[EmplInfo] CHECK CONSTRAINT [FK_EmplInfo_Employer]
GO
ALTER TABLE [dbo].[EmplInfo]  WITH CHECK ADD  CONSTRAINT [FK_EmplInfo_Entity] FOREIGN KEY([entity_id])
REFERENCES [dbo].[Entity] ([entity_id])
GO
ALTER TABLE [dbo].[EmplInfo] CHECK CONSTRAINT [FK_EmplInfo_Entity]
GO
ALTER TABLE [dbo].[EmplInfo]  WITH CHECK ADD  CONSTRAINT [FK_EmplInfo_ImmHead] FOREIGN KEY([imm_head])
REFERENCES [dbo].[Entity] ([entity_id])
GO
ALTER TABLE [dbo].[EmplInfo] CHECK CONSTRAINT [FK_EmplInfo_ImmHead]
GO
ALTER TABLE [dbo].[EmplInfo]  WITH CHECK ADD  CONSTRAINT [FK_EmplInfo_T_Designation] FOREIGN KEY([des_id])
REFERENCES [dbo].[T_Designation] ([des_id])
GO
ALTER TABLE [dbo].[EmplInfo] CHECK CONSTRAINT [FK_EmplInfo_T_Designation]
GO
ALTER TABLE [dbo].[Entity]  WITH CHECK ADD  CONSTRAINT [FK_Entity_T_EntityType] FOREIGN KEY([entity_type])
REFERENCES [dbo].[T_EntityType] ([entity_type])
GO
ALTER TABLE [dbo].[Entity] CHECK CONSTRAINT [FK_Entity_T_EntityType]
GO
ALTER TABLE [dbo].[EntityGroup]  WITH CHECK ADD  CONSTRAINT [FK_EntityGroup_Group] FOREIGN KEY([grp_id])
REFERENCES [dbo].[Group] ([grp_id])
GO
ALTER TABLE [dbo].[EntityGroup] CHECK CONSTRAINT [FK_EntityGroup_Group]
GO
ALTER TABLE [dbo].[EntityGroup]  WITH CHECK ADD  CONSTRAINT [FK_EntityLoanClass_Entity] FOREIGN KEY([entity_id])
REFERENCES [dbo].[Entity] ([entity_id])
GO
ALTER TABLE [dbo].[EntityGroup] CHECK CONSTRAINT [FK_EntityLoanClass_Entity]
GO
ALTER TABLE [dbo].[ExpenseInfo]  WITH CHECK ADD  CONSTRAINT [FK_ExpenseInfo_Loan] FOREIGN KEY([loan_id])
REFERENCES [dbo].[Loan] ([loan_id])
GO
ALTER TABLE [dbo].[ExpenseInfo] CHECK CONSTRAINT [FK_ExpenseInfo_Loan]
GO
ALTER TABLE [dbo].[GroupAttribute]  WITH CHECK ADD  CONSTRAINT [FK_GroupAttribute_Group] FOREIGN KEY([grp_id])
REFERENCES [dbo].[Group] ([grp_id])
GO
ALTER TABLE [dbo].[GroupAttribute] CHECK CONSTRAINT [FK_GroupAttribute_Group]
GO
ALTER TABLE [dbo].[GroupAttribute]  WITH CHECK ADD  CONSTRAINT [FK_GroupAttribute_T_LoanType] FOREIGN KEY([loan_type])
REFERENCES [dbo].[T_LoanType] ([loan_type])
GO
ALTER TABLE [dbo].[GroupAttribute] CHECK CONSTRAINT [FK_GroupAttribute_T_LoanType]
GO
ALTER TABLE [dbo].[IdentityInfo]  WITH CHECK ADD  CONSTRAINT [FK_IdentityInfo_Entity] FOREIGN KEY([entity_id])
REFERENCES [dbo].[Entity] ([entity_id])
GO
ALTER TABLE [dbo].[IdentityInfo] CHECK CONSTRAINT [FK_IdentityInfo_Entity]
GO
ALTER TABLE [dbo].[Interest]  WITH CHECK ADD  CONSTRAINT [FK_Interest_Loan] FOREIGN KEY([loan_id])
REFERENCES [dbo].[Loan] ([loan_id])
GO
ALTER TABLE [dbo].[Interest] CHECK CONSTRAINT [FK_Interest_Loan]
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK_Loan_T_Purpose] FOREIGN KEY([purp_id])
REFERENCES [dbo].[T_Purpose] ([purp_id])
GO
ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK_Loan_T_Purpose]
GO
ALTER TABLE [dbo].[LoanAppv]  WITH CHECK ADD  CONSTRAINT [FK_LoanAppv_Loan] FOREIGN KEY([loan_id])
REFERENCES [dbo].[Loan] ([loan_id])
GO
ALTER TABLE [dbo].[LoanAppv] CHECK CONSTRAINT [FK_LoanAppv_Loan]
GO
ALTER TABLE [dbo].[LoanAss]  WITH CHECK ADD  CONSTRAINT [FK_LoanAss_Loan] FOREIGN KEY([loan_id])
REFERENCES [dbo].[Loan] ([loan_id])
GO
ALTER TABLE [dbo].[LoanAss] CHECK CONSTRAINT [FK_LoanAss_Loan]
GO
ALTER TABLE [dbo].[LoanAssFinInfo]  WITH CHECK ADD  CONSTRAINT [FK_LoanAssFinInfo_Competitor] FOREIGN KEY([comp_id])
REFERENCES [dbo].[Competitor] ([comp_id])
GO
ALTER TABLE [dbo].[LoanAssFinInfo] CHECK CONSTRAINT [FK_LoanAssFinInfo_Competitor]
GO
ALTER TABLE [dbo].[LoanAssFinInfo]  WITH CHECK ADD  CONSTRAINT [FK_LoanAssFinInfo_Loan] FOREIGN KEY([loan_id])
REFERENCES [dbo].[Loan] ([loan_id])
GO
ALTER TABLE [dbo].[LoanAssFinInfo] CHECK CONSTRAINT [FK_LoanAssFinInfo_Loan]
GO
ALTER TABLE [dbo].[LoanAssMonExp]  WITH CHECK ADD  CONSTRAINT [FK_LoanAssMonExp_Loan] FOREIGN KEY([loan_id])
REFERENCES [dbo].[Loan] ([loan_id])
GO
ALTER TABLE [dbo].[LoanAssMonExp] CHECK CONSTRAINT [FK_LoanAssMonExp_Loan]
GO
ALTER TABLE [dbo].[LoanAssMonExp]  WITH CHECK ADD  CONSTRAINT [FK_LoanAssMonExp_T_ExpenseType] FOREIGN KEY([exp_type])
REFERENCES [dbo].[T_ExpenseType] ([exp_type])
GO
ALTER TABLE [dbo].[LoanAssMonExp] CHECK CONSTRAINT [FK_LoanAssMonExp_T_ExpenseType]
GO
ALTER TABLE [dbo].[LoanCancel]  WITH CHECK ADD  CONSTRAINT [FK_LoanCancel_Loan] FOREIGN KEY([loan_id])
REFERENCES [dbo].[Loan] ([loan_id])
GO
ALTER TABLE [dbo].[LoanCancel] CHECK CONSTRAINT [FK_LoanCancel_Loan]
GO
ALTER TABLE [dbo].[LoanCancel]  WITH CHECK ADD  CONSTRAINT [FK_LoanCancel_T_LoanCancelReason] FOREIGN KEY([reason_id])
REFERENCES [dbo].[T_LoanCancelReason] ([reason_id])
GO
ALTER TABLE [dbo].[LoanCancel] CHECK CONSTRAINT [FK_LoanCancel_T_LoanCancelReason]
GO
ALTER TABLE [dbo].[LoanCharge]  WITH CHECK ADD  CONSTRAINT [FK_LoanCharge_Loan] FOREIGN KEY([loan_id])
REFERENCES [dbo].[Loan] ([loan_id])
GO
ALTER TABLE [dbo].[LoanCharge] CHECK CONSTRAINT [FK_LoanCharge_Loan]
GO
ALTER TABLE [dbo].[LoanCharge]  WITH CHECK ADD  CONSTRAINT [FK_LoanCharge_T_ChargeType1] FOREIGN KEY([charge_type])
REFERENCES [dbo].[T_ChargeType] ([charge_type])
GO
ALTER TABLE [dbo].[LoanCharge] CHECK CONSTRAINT [FK_LoanCharge_T_ChargeType1]
GO
ALTER TABLE [dbo].[LoanClassAdvance]  WITH CHECK ADD  CONSTRAINT [FK_LoanClassAdvance_LoanClass] FOREIGN KEY([class_id])
REFERENCES [dbo].[LoanClass] ([class_id])
GO
ALTER TABLE [dbo].[LoanClassAdvance] CHECK CONSTRAINT [FK_LoanClassAdvance_LoanClass]
GO
ALTER TABLE [dbo].[LoanClassCharge]  WITH CHECK ADD  CONSTRAINT [FK_LoanCharge_T_ChargeType] FOREIGN KEY([charge_type])
REFERENCES [dbo].[T_ChargeType] ([charge_type])
GO
ALTER TABLE [dbo].[LoanClassCharge] CHECK CONSTRAINT [FK_LoanCharge_T_ChargeType]
GO
ALTER TABLE [dbo].[LoanClassCharge]  WITH CHECK ADD  CONSTRAINT [FK_LoanClassCharge_LoanClass] FOREIGN KEY([class_id])
REFERENCES [dbo].[LoanClass] ([class_id])
GO
ALTER TABLE [dbo].[LoanClassCharge] CHECK CONSTRAINT [FK_LoanClassCharge_LoanClass]
GO
ALTER TABLE [dbo].[LoanClose]  WITH CHECK ADD  CONSTRAINT [FK_LoanClose_T_LoanCloseReason] FOREIGN KEY([reason_id])
REFERENCES [dbo].[T_LoanCloseReason] ([reason_id])
GO
ALTER TABLE [dbo].[LoanClose] CHECK CONSTRAINT [FK_LoanClose_T_LoanCloseReason]
GO
ALTER TABLE [dbo].[LoanComaker]  WITH CHECK ADD  CONSTRAINT [FK_LoanComaker_Loan] FOREIGN KEY([loan_id])
REFERENCES [dbo].[Loan] ([loan_id])
GO
ALTER TABLE [dbo].[LoanComaker] CHECK CONSTRAINT [FK_LoanComaker_Loan]
GO
ALTER TABLE [dbo].[LoanReject]  WITH CHECK ADD  CONSTRAINT [FK_LoanReject_Loan] FOREIGN KEY([loan_id])
REFERENCES [dbo].[Loan] ([loan_id])
GO
ALTER TABLE [dbo].[LoanReject] CHECK CONSTRAINT [FK_LoanReject_Loan]
GO
ALTER TABLE [dbo].[LoanReject]  WITH CHECK ADD  CONSTRAINT [FK_LoanReject_T_LoanRejectReason] FOREIGN KEY([reason_id])
REFERENCES [dbo].[T_LoanRejectReason] ([reason_id])
GO
ALTER TABLE [dbo].[LoanReject] CHECK CONSTRAINT [FK_LoanReject_T_LoanRejectReason]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_BankWithdrawal] FOREIGN KEY([wd_id])
REFERENCES [dbo].[BankWithdrawal] ([wd_id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_BankWithdrawal]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Entity] FOREIGN KEY([entity_id])
REFERENCES [dbo].[Entity] ([entity_id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Entity]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_T_PaymentMethod] FOREIGN KEY([pmt_method])
REFERENCES [dbo].[T_PaymentMethod] ([pmt_method])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_T_PaymentMethod]
GO
ALTER TABLE [dbo].[PaymentDetail]  WITH CHECK ADD  CONSTRAINT [FK_PaymentDetail_Loan] FOREIGN KEY([loan_id])
REFERENCES [dbo].[Loan] ([loan_id])
GO
ALTER TABLE [dbo].[PaymentDetail] CHECK CONSTRAINT [FK_PaymentDetail_Loan]
GO
ALTER TABLE [dbo].[PaymentDetail]  WITH CHECK ADD  CONSTRAINT [FK_PaymentDetail_Payment] FOREIGN KEY([payment_id])
REFERENCES [dbo].[Payment] ([payment_id])
GO
ALTER TABLE [dbo].[PaymentDetail] CHECK CONSTRAINT [FK_PaymentDetail_Payment]
GO
ALTER TABLE [dbo].[PersonalInfo]  WITH CHECK ADD  CONSTRAINT [FK_PersonalInfo_Client] FOREIGN KEY([entity_id])
REFERENCES [dbo].[Entity] ([entity_id])
GO
ALTER TABLE [dbo].[PersonalInfo] CHECK CONSTRAINT [FK_PersonalInfo_Client]
GO
ALTER TABLE [dbo].[PersonalInfo]  WITH CHECK ADD  CONSTRAINT [FK_PersonalInfo_T_InfoSource] FOREIGN KEY([source_id])
REFERENCES [dbo].[T_InfoSource] ([source_id])
GO
ALTER TABLE [dbo].[PersonalInfo] CHECK CONSTRAINT [FK_PersonalInfo_T_InfoSource]
GO
ALTER TABLE [dbo].[RefInfo]  WITH CHECK ADD  CONSTRAINT [FK_RefInfo_Entity] FOREIGN KEY([entity_id])
REFERENCES [dbo].[Entity] ([entity_id])
GO
ALTER TABLE [dbo].[RefInfo] CHECK CONSTRAINT [FK_RefInfo_Entity]
GO
ALTER TABLE [dbo].[RefInfo]  WITH CHECK ADD  CONSTRAINT [FK_RefInfo_EntityRef] FOREIGN KEY([ref_entity_id])
REFERENCES [dbo].[Entity] ([entity_id])
GO
ALTER TABLE [dbo].[RefInfo] CHECK CONSTRAINT [FK_RefInfo_EntityRef]
GO
ALTER TABLE [dbo].[RefInfo]  WITH CHECK ADD  CONSTRAINT [FK_RefInfo_T_ReferenceType] FOREIGN KEY([ref_type])
REFERENCES [dbo].[T_ReferenceType] ([ref_type])
GO
ALTER TABLE [dbo].[RefInfo] CHECK CONSTRAINT [FK_RefInfo_T_ReferenceType]
GO
ALTER TABLE [dbo].[T_LoanType]  WITH CHECK ADD  CONSTRAINT [FK_T_LoanType_T_AccountType] FOREIGN KEY([acct_type])
REFERENCES [dbo].[T_AccountType] ([acct_type])
GO
ALTER TABLE [dbo].[T_LoanType] CHECK CONSTRAINT [FK_T_LoanType_T_AccountType]
GO
ALTER TABLE [dbo].[T_Town]  WITH CHECK ADD  CONSTRAINT [FK_T_Town_T_Province] FOREIGN KEY([area_code])
REFERENCES [dbo].[T_Province] ([area_code])
GO
ALTER TABLE [dbo].[T_Town] CHECK CONSTRAINT [FK_T_Town_T_Province]
GO
/****** Object:  StoredProcedure [dbo].[sp_acc_post_ledger]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_acc_post_ledger]
AS
BEGIN
	select *
	  from Ledger L (nolock)
	 where L.event_object is null
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_acct_info]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cl_get_acct_info]
	@entity_id char(10)
AS
BEGIN
	select A.*,
	       B.bank_code,
		   B.branch,
		   (T.bank_name + isnull(' - ' + B.branch,'')) bank_name,
		   dbo.udf_format_date(A.card_expiry) card_expiry_f,
		   (T.bank_code + isnull(' - ' + A.acct_no,'')) bank_details
	  from AcctInfo (nolock) A
 left join Bank (nolock) B
        on B.bank_id = A.bank_id
 left join T_Bank (nolock) T
        on T.bank_code = B.bank_code
	 where entity_id = @entity_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_address_info_pres]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cl_get_address_info_pres]
	@entity_id char(10)
AS
BEGIN
	select A.*,
	       (select P.lastname + ', ' + P.firstname from PersonalInfo P (nolock) where P.entity_id = A.landlord) landlord_name,
		   (select mobile_no from ContactInfo C (nolock) where C.entity_id = A.landlord) landlord_mobile,
		   (select home_phone from ContactInfo C (nolock) where C.entity_id = A.landlord) landlord_homephone
	  from AddressInfo (nolock) A
	 where A.entity_id = @entity_id
	   and isnull(is_prov,0) = 0
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_address_info_prov]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_cl_get_address_info_prov]
	@entity_id char(10)
AS
BEGIN
	select A.*,
	       (select P.lastname + ', ' + P.firstname from PersonalInfo P (nolock) where P.entity_id = A.landlord) landlord_name,
		   (select mobile_no from ContactInfo C (nolock) where C.entity_id = A.landlord) landlord_mobile,
		   (select home_phone from ContactInfo C (nolock) where C.entity_id = A.landlord) landlord_homephone
	  from AddressInfo (nolock) A
	 where A.entity_id = @entity_id
	   and isnull(is_prov,0) = 1
END


GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_contact_info]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cl_get_contact_info]
	@entity_id char(10)
AS
BEGIN
	select *
	  from ContactInfo (nolock)
	 where entity_id = @entity_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_empl_info]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cl_get_empl_info]
	@entity_id char(10)
AS
BEGIN
	select I.*,
	       E.emp_name,
		   E.emp_add,
		   E.grp_id,
		   G.grp_name,
		   (P.lastname + ', ' + P.firstname) imm_head_name
	  from EmplInfo (nolock) I
 left join Employer (nolock) E
	    on E.emp_id = I.emp_id 
 left join PersonalInfo (nolock) P
	    on P.entity_id = I.imm_head
 left join [Group] (nolock) G
        on G.grp_id = E.grp_id
	 where I.entity_id = @entity_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_entity]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cl_get_entity]
	@entity_id char(10)
AS
BEGIN
	select E.*,
	       (select P.lastname + ', ' + P.firstname from PersonalInfo P (nolock) where P.entity_id = E.ref_entity_id) referee
	  from Entity (nolock) E
	 where E.entity_id = @entity_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_groups]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cl_get_groups]
	@entity_id varchar(10)
AS
BEGIN
	declare @client_groups table
	(
		group_id char(8)
	)

	-- group where employer belongs
	insert @client_groups
	select grp_id
	  from EmplInfo E (nolock)
	  join Employer Y (nolock)
	    on Y.emp_id = E.emp_id
	 where E.entity_id = @entity_id

	-- other groups
	insert @client_groups
	select grp_id
	  from EntityGroup E (nolock)
	 where E.entity_id = @entity_id

	-- result
	select G.grp_id,
	       G.grp_name,
		   E.emp_id
	  from [Group] G (nolock)
      join @client_groups C
        on C.group_id = G.grp_id
 left join Employer E (nolock)
        on E.grp_id = G.grp_id
  order by grp_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_ident_info]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cl_get_ident_info]
	@entity_id char(10)
AS
BEGIN
	select I.*,
	       T.ident_name,
	       T.has_expiry,
		   isnull(I.exp_date,getdate()) expiry,
		   dbo.udf_format_date(exp_date) exp_date_f
	  from IdentityInfo (nolock) I
	  join T_IdentityType T (nolock)
	    on T.ident_type = I.ident_type
	 where entity_id = @entity_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_loan_class_access]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_cl_get_loan_class_access]
	@entity_id char(10)
AS
BEGIN
	declare @class_access table
	(
		class_id int
	)
	-- add class id from EntityLoanClass
	insert into @class_access
	select class_id
	  from EntityLoanClass E (nolock)
	 where E.entity_id = @entity_id

	-- add class id from LoanClass
	insert into @class_access
	select class_id
	  from LoanClass (nolock) C
	 where C.grp_id = (select M.grp_id 
	                     from EmplInfo E (nolock) 
						 join Employer M (nolock)
						   on M.emp_id = E.emp_id
						where E.entity_id = @entity_id)
	
	-- return
	select C.*,
	       dbo.udf_format_currency(C.int_rate) int_rate_f,
	       dbo.udf_format_currency(C.max_loan) max_loan_f,
	       G.grp_name,
	       -- T.loan_type_name,
		   M.display as comp_method
	  from LoanClass (nolock) C
	  -- join T_LoanType (nolock) T
	  --   on T.loan_type = C.loan_type
	  join dbo.fxn_get_int_comp_method () M
	    on M.value = C.int_comp_method
	  join [Group] (nolock) G
	    on G.grp_id = C.grp_id
	 where C.class_id in (select class_id from @class_access)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_loan_class_avail]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cl_get_loan_class_avail]
	@entity_id char(10)
AS
BEGIN
	declare @class_access table
	(
		class_id int
	)
	-- add class id from EntityLoanClass
	insert into @class_access
	select class_id
	  from EntityLoanClass E (nolock)
	 where E.entity_id = @entity_id

	-- add class id from LoanClass
	insert into @class_access
	select class_id
	  from LoanClass (nolock) C
	 where C.grp_id = (select M.grp_id 
	                     from EmplInfo E (nolock) 
						 join Employer M (nolock)
						   on M.emp_id = E.emp_id
						where E.entity_id = @entity_id)
	
	-- return
	select C.*,
	       dbo.udf_format_currency(C.int_rate) int_rate_f,
	       dbo.udf_format_currency(C.max_loan) max_loan_f,
	       G.grp_name,
	       --T.loan_type_name,
		   M.display as comp_method
	  from LoanClass (nolock) C
	  --join T_LoanType (nolock) T
	  --  on T.loan_type = C.loan_type
	  join dbo.fxn_get_int_comp_method () M
	    on M.value = C.int_comp_method
	  join [Group] (nolock) G
	    on G.grp_id = C.grp_id
	 where C.class_id not in (select class_id from @class_access)

END

GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_loans]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cl_get_loans]
	@entity_id char(10),
	@status char(1) = null
AS
BEGIN
	select L.*,
	       C.class_name,
		   dbo.udf_format_currency(C.int_rate) as class_int,
	       S.status_name,
		   M.display as appv_method_name,
		   dbo.udf_format_date(L.date_appl) date_appl_f,
		   dbo.udf_format_date(V.date_appv) date_appv_f,
		   dbo.udf_format_currency(L.amt_appl) amt_appl_f,
		   dbo.udf_format_currency(V.amt_appv) amt_appv_f,
		   dbo.udf_format_currency(L.balance) balance_f,
		   dbo.udf_format_currency(L.int_deficit) int_deficit_f,
		   dbo.udf_format_currency(L.prc_deficit) prc_deficit_f,
		   dbo.udf_format_currency(L.amort) amort_f,
		   T.loan_type_name,
		   Y.acct_type_name,
		   C.int_comp_method,
		   C.dim_type,
		   coalesce(L.last_trans_date,V.date_appv) last_transaction_date,
		   C.int_rate,
		   R.rel_amt,
		   V.terms,
		   -- payments regular
		   (select count(1) 
		      from PaymentDetail D (nolock) 
			  join Payment P (nolock) 
			    on P.payment_id = D.payment_id 
			 where D.loan_id = L.loan_id
			   and isnull(P.is_advance,0) = 0) payments,
		   -- payments advance
		   (select count(1) 
		      from PaymentDetail D (nolock) 
			  join Payment P (nolock) 
			    on P.payment_id = D.payment_id 
			 where D.loan_id = L.loan_id
			   and isnull(P.is_advance,0) = 1) payments_advance
	  from Loan L (nolock)
	  join LoanClass C (nolock)
	    on C.class_id = L.class_id
	  join T_LoanStatus S (nolock)
	    on L.status_id = S.status_id
 left join LoanAppv V (nolock)
        on V.loan_id = L.loan_id
 left join LoanRelease R
        on R.loan_id = L.loan_id
 left join dbo.fxn_get_appv_method() M
	    on M.value = V.appv_method
	  join dbo.fxn_get_parent_group() P
	    on P.grp_id = C.grp_id
	  join GroupAttribute A (nolock)
	    on A.grp_id = P.top_grp_id
	  join T_LoanType T (nolock)
	    on T.loan_type = A.loan_type 
	  join T_AccountType Y (nolock)
	    on Y.acct_type = T.acct_type
	 where L.entity_id = @entity_id
	   and (isnull(@status,'') = '' or L.status_id = @status)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_loans_comakers]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cl_get_loans_comakers]
	@entity_id char(10)
AS
BEGIN
	select C.*,
	       (P.lastname + ', ' + P.firstname) name
	  from LoanComaker C (nolock)
	  join PersonalInfo P (nolock)
	    on P.entity_id = C.entity_id
	 where exists (select 1
	                 from Loan L (nolock)
					where L.entity_id = @entity_id)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_personal_info]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cl_get_personal_info]
	@entity_id char(10)
AS
BEGIN
	select *
	  from PersonalInfo (nolock)
	 where entity_id = @entity_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_promissory_notes]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cl_get_promissory_notes]
	@entity_id char(10),
	@available_only smallint = 0
AS
BEGIN
	select N.*,
	       (case when L.loan_id is not null then 'Used' else 'Available' end) status_name  
	  from EntityPromissoryNote N (nolock)
 left join (select loan_id,
				   pn_no
			  from Loan (nolock)
			 where status_id = 'R'
			   and entity_id = @entity_id) L
		on L.pn_no = N.pn_no
	 where N.entity_id = @entity_id
	   and (isnull(@available_only,0) = 0 
	    or (isnull(@available_only,0) = 1 and isnull(L.pn_no,'') = ''))

END

GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_ref_address_info]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[sp_cl_get_ref_address_info]
	@entity_id char(10)
AS
BEGIN
	select *
	  from AddressInfo A (nolock)
	 where A.entity_id 
	    in (select ref_entity_id
		      from RefInfo R (nolock)
			 where R.entity_id = @entity_id)
	   and isnull(A.is_prov,0) = 0
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_ref_contact_info]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[sp_cl_get_ref_contact_info]
	@entity_id char(10)
AS
BEGIN
	select *
	  from ContactInfo C (nolock)
	 where C.entity_id 
	    in (select ref_entity_id
		      from RefInfo R (nolock)
			 where R.entity_id = @entity_id)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_ref_info]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cl_get_ref_info]
	@entity_id char(10)
AS
BEGIN
	select R.*,
	       (P.lastname + ', ' + P.firstname) name,
		   T.ref_name,
		   T.is_family
	  from RefInfo (nolock) R
	  join PersonalInfo (nolock) P
	    on R.ref_entity_id = P.entity_id
	  join T_ReferenceType (nolock) T
	    on T.ref_type = R.ref_type
	 where R.entity_id = @entity_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_ref_personal_info]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cl_get_ref_personal_info]
	@entity_id char(10)
AS
BEGIN
	select *
	  from PersonalInfo P (nolock)
	 where P.entity_id 
	    in (select ref_entity_id
		      from RefInfo R (nolock)
			 where R.entity_id = @entity_id)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_acct_type]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_acct_type]
AS
BEGIN
	select *
	  from T_AccountType T (nolock)
  order by acct_type_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_appv_method]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_appv_method]	
AS
BEGIN
	select * 
	  from dbo.fxn_get_appv_method()
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_banks]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_banks]
AS
BEGIN
	select bank_id,
	       (rtrim(bank_code) + ' - ' + branch) bank_name
	  from Bank B (nolock)
  order by bank_name

END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_cancel_reason]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_cancel_reason]
AS
BEGIN
	select R.reason_id,
	       R.reason_name
	  from T_LoanCancelReason R (nolock)
  order by R.reason_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_charge_type]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_charge_type]
AS
BEGIN
	select *
	  from T_ChargeType (nolock)
  order by charge_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_civil_status]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_dd_get_civil_status]
AS
BEGIN
	declare @temp_civil_status table(
		value char(1),
		display varchar(12)
	)
	
	insert @temp_civil_status
	select 'S','Single'
	union
	select 'M','Married'
	union
	select 'P','Separated'
	union
	select 'W','Widowed'
	union
	select 'A','Annulled'
	
	select * 
	  from @temp_civil_status
END
GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_close_reason]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_close_reason]
AS
BEGIN
	select R.reason_id,
	       R.reason_name
	  from T_LoanCloseReason R (nolock)
	 where isnull(is_auto_post,0) = 0
  order by R.reason_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_competitors]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_competitors]
AS
BEGIN
	select *
	  from Competitor C (nolock)
  order by comp_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_education_code]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_dd_get_education_code]
AS
BEGIN
	declare @temp_educ_code table(
		value char(1),
		display varchar(12)
	)
	
	insert @temp_educ_code
	select 'E','Elementary'
	union
	select 'H','High School'
	union
	select 'C','College'
	union
	select 'O','Others'
	
	select * 
	  from @temp_educ_code
END


GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_employment_status]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_dd_get_employment_status]
AS
BEGIN
	declare @temp_employement_status table(
		value char(1),
		display varchar(20)
	)
	
	insert @temp_employement_status
	select 'R','Regular/Permanent'
	union
	select 'C','Contractual'
	union
	select 'M','Commission-based'
	
	select * 
	  from @temp_employement_status
END


GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_exp_type]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_exp_type]
AS
BEGIN
	select exp_type,
	       exp_name
	  from T_ExpenseType E (nolock)
  order by E.exp_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_gender]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_dd_get_gender]
AS
BEGIN
	declare @temp_gender table(
		value char(1),
		display varchar(12)
	)
	
	insert @temp_gender
	select 'M','Male'
	union
	select 'F','Female'
	
	select * 
	  from @temp_gender
END


GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_group]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_group]
AS
BEGIN
	select grp_id,
	       grp_name,
		   loc_code,
		   par_grp_id,
		   is_active
	  from [Group] G (nolock)
  order by grp_name

END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_ident_type]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_ident_type]
AS
BEGIN
	select *
	  from T_IdentityType I (nolock)
  order by I.ident_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_info_sources]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_info_sources]
AS
BEGIN
	select *
	  from T_InfoSource (nolock)
  order by source_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_int_comp_method]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_int_comp_method]
AS
BEGIN
	select *
	  from dbo.fxn_get_int_comp_method()
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_loan_class]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_loan_class]
	@entity_id char(10),
	@new_loan smallint
AS
BEGIN
    declare @dt datetime 
	declare @class_access table
	(
		class_id int
	)
	
	set @dt = getdate()

	-- add class id from EntityLoanClass
	if isnull(@new_loan,1) = 1
	begin
		/*insert into @class_access
		select E.class_id
		  from EntityLoanClass E (nolock)
		  join LoanClass C (nolock)
		    on C.class_id = E.class_id
		 where E.entity_id = @entity_id
		   and (
			   ((C.valid_until is null) and (@dt >= C.valid_from))
			or ((C.valid_until is not null) and (@dt between C.valid_from and C.valid_until))
			   )*/

		insert into @class_access
		select C.class_id
		  from EntityGroup E (nolock)
		  join LoanClass C (nolock)
		    on C.grp_id = E.grp_id
		 where E.entity_id = @entity_id
		   and (
			   ((C.valid_until is null) and (@dt >= C.valid_from))
			or ((C.valid_until is not null) and (@dt between C.valid_from and C.valid_until))
			   )

		-- add class id from LoanClass
		insert into @class_access
		select class_id
		  from LoanClass (nolock) C
		 where C.grp_id = (select M.grp_id 
							 from EmplInfo E (nolock) 
							 join Employer M (nolock)
							   on M.emp_id = E.emp_id
							where E.entity_id = @entity_id)
		  and (
			  ((C.valid_until is null) and (@dt >= C.valid_from))
		   or ((C.valid_until is not null) and (@dt between C.valid_from and C.valid_until))
			  )
	end
	else
	begin
		insert into @class_access
		select class_id
		  from LoanClass (nolock) C
	end

	-- return
	select L.*,
	       T.loan_type_name,
	       (L.class_name + ' - ' + case L.int_comp_method when 'F' then 'Fixed' else 'Diminishing' end + case L.dim_type when 1 then ' Scheduled' when 2 then ' Fixed ' else '' end) class_name_method,
		   T.max_concurrent,
		   T.max_tot_amt max_loantype_amount,
		   T.ident_docs,
	       (case when isnull(L.comakers_max,0) = 0 and isnull(L.comakers_min,0) = 0 then 'No comakers required' 
			else case when L.comakers_min = L.comakers_max then cast(L.comakers_min as varchar) + ' required'
				 else cast(L.comakers_min as varchar) + ' - ' + cast(L.comakers_max as varchar) + ' required' 
				 end
			end) comakers_desc,
		   G.grp_name,
		   A.max_tot_amt max_group_amount,
		   A.loan_type,
		   A.concurrent
	  from LoanClass L (nolock)
	  join dbo.fxn_get_parent_group() G 
	    on G.grp_id = L.grp_id
	  join GroupAttribute A (nolock)
	    on A.grp_id = G.top_grp_id
	  join T_LoanType T (nolock)
	    on T.loan_type = A.loan_type
     where L.class_id in (select * from @class_access)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_loan_status]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_loan_status]
	@status_id char(1) = ''
AS
BEGIN
	declare @loan_status table
	(
		status_id char(1),
		status_name varchar(30)
	)

	if isnull(@status_id,'') = ''
		insert into @loan_status select status_id, status_name from T_LoanStatus S (nolock) where status_id = 'P'
	else if isnull(@status_id,'') = 'P'
		insert into @loan_status select status_id, status_name from T_LoanStatus S (nolock) where status_id in ('P','A','C')
	else if isnull(@status_id,'') = 'A'
		insert into @loan_status select status_id, status_name from T_LoanStatus S (nolock) where status_id in ('A','R','C')
	else if isnull(@status_id,'') = 'R'
		insert into @loan_status select status_id, status_name from T_LoanStatus S (nolock) where status_id in ('R')
	select *
      from @loan_status
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_loan_type]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_loan_type]
AS
BEGIN
	select loan_type,
	       loan_type_name,
		   max_tot_amt,
		   max_concurrent
	  from T_LoanType (nolock)
  order by loan_type_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_payment_frequency]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_payment_frequency]
AS
BEGIN
	select *
	  from dbo.fxn_get_pay_freq()
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_payment_methods]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_dd_get_payment_methods]
AS
BEGIN
	select *,
	       dbo.udf_format_currency(pmt_charge) charge
	  from T_PaymentMethod (nolock)
  order by pmt_method_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_purpose]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_purpose]
AS
BEGIN
	select purp_id,
	       purpose
	  from T_Purpose (nolock)
  order by purpose

END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_recommendation]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_recommendation]
AS
BEGIN
	select *
	  from dbo.fxn_get_recommendation()
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_ref_type]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_ref_type]
AS
BEGIN
	select *
	  from T_ReferenceType (nolock)
  order by ref_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_reject_reason]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_reject_reason]
AS
BEGIN
	select R.reason_id,
	       R.reason_name
	  from T_LoanRejectReason R (nolock)
  order by R.reason_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_release_method]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_release_method]
AS
BEGIN
	select *
	  from dbo.fxn_get_release_method()
  order by display
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_residence_status]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_residence_status]
AS
BEGIN
	declare @temp_residence_status table(
		value char(1),
		display varchar(20)
	)
	
	insert @temp_residence_status
	select 'O','Owned'
	union
	select 'L','Living with parents'
	union
	select 'M','Mortgaged'
	union
	select 'R','Rented'
	
	select * 
	  from @temp_residence_status
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_towns]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_towns]
AS
BEGIN
	select post_code,
	       (town + ', ' + province) town
	  from T_Town T (nolock)
	  join T_Province P (nolock)
	    on P.area_code = T.area_code 
  order by town 
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dev_fix_sequence]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_dev_fix_sequence]
AS
BEGIN
	declare @max_id int,
		    @start int,
			@end int,
			@seq_obj char(3)

	set @start = 1
	set @end = 5

	-- entity
	select @max_id = max(cast(replace(entity_id,substring(entity_id,@start,@end),'') as integer)) from Entity
	if isnull(@max_id,'') > 0 
	begin
	    set @seq_obj = 'ENT'

		update [Sequence] set last_id = @max_id where seq_object = @seq_obj
		
		if @@ROWCOUNT = 0 insert into [Sequence] values (@seq_obj,@max_id)
	end
	-- entity

	-- group
	select @max_id = max(cast(replace(grp_id,substring(grp_id,@start,@end),'') as integer)) from [Group]
	if isnull(@max_id,'') > 0 
	begin
		set @seq_obj = 'GRP'

		update [Sequence] set last_id = @max_id where seq_object = @seq_obj
		
		if @@ROWCOUNT = 0 insert into [Sequence] values (@seq_obj,@max_id)
	end
	-- group

	-- employer
	select @max_id = max(cast(replace(emp_id,substring(emp_id,@start,@end),'') as integer)) from Employer
	if isnull(@max_id,'') > 0 
	begin
	    set @seq_obj = 'EML'

		update [Sequence] set last_id = @max_id where seq_object = @seq_obj
		
		if @@ROWCOUNT = 0 insert into [Sequence] values (@seq_obj,@max_id)
	end

	-- employer

	-- bank
	select @max_id = max(cast(replace(bank_id,substring(bank_id,@start,@end),'') as integer)) from Bank
	if isnull(@max_id,'') > 0 
	begin
	    set @seq_obj = 'BNK'

		update [Sequence] set last_id = @max_id where seq_object = @seq_obj
		
		if @@ROWCOUNT = 0 insert into [Sequence] values (@seq_obj,@max_id)
	end
	-- bank

	-- designation
	select @max_id = max(des_id) from T_Designation
	if isnull(@max_id,'') > 0 
	begin
	    set @seq_obj = 'DSG'

		update [Sequence] set last_id = @max_id where seq_object = @seq_obj
		
		if @@ROWCOUNT = 0 insert into [Sequence] values (@seq_obj,@max_id)
	end
	-- designation

	-- loan class
	select @max_id = max(class_id) from LoanClass
	if isnull(@max_id,'') > 0 
	begin
	    set @seq_obj = 'LNC'

		update [Sequence] set last_id = @max_id where seq_object = @seq_obj
		
		if @@ROWCOUNT = 0 insert into [Sequence] values (@seq_obj,@max_id)
	end
	-- loan class

	-- competitor
	select @max_id = max(cast(replace(comp_id,substring(comp_id,@start,@end),'') as integer)) from Competitor
	if isnull(@max_id,'') > 0 
	begin
	    set @seq_obj = 'CMP'

		update [Sequence] set last_id = @max_id where seq_object = @seq_obj
		
		if @@ROWCOUNT = 0 insert into [Sequence] values (@seq_obj,@max_id)
	end
	-- competitor

	-- purpose
	select @max_id = max(purp_id) from T_Purpose
	if isnull(@max_id,'') > 0 
	begin
	    set @seq_obj = 'PRP'

		update [Sequence] set last_id = @max_id where seq_object = @seq_obj
		
		if @@ROWCOUNT = 0 insert into [Sequence] values (@seq_obj,@max_id)
	end
	-- purpose

	-- account type
	select @max_id = max(acct_type) from T_AccountType
	if isnull(@max_id,'') > 0 
	begin
	    set @seq_obj = 'ACT'

		update [Sequence] set last_id = @max_id where seq_object = @seq_obj
		
		if @@ROWCOUNT = 0 insert into [Sequence] values (@seq_obj,@max_id)
	end
	-- account type

	-- loan type
	select @max_id = max(loan_type) from T_LoanType
	if isnull(@max_id,'') > 0 
	begin
	    set @seq_obj = 'LNT'

		update [Sequence] set last_id = @max_id where seq_object = @seq_obj
		
		if @@ROWCOUNT = 0 insert into [Sequence] values (@seq_obj,@max_id)
	end
	-- loan type

	-- loan cancellation reason
	select @max_id = max(reason_id) from T_LoanCancelReason
	if isnull(@max_id,'') > 0 
	begin
	    set @seq_obj = 'LCR'

		update [Sequence] set last_id = @max_id where seq_object = @seq_obj
		
		if @@ROWCOUNT = 0 insert into [Sequence] values (@seq_obj,@max_id)
	end
	-- loan cancellation reason

	-- loan reject reason
	select @max_id = max(reason_id) from T_LoanRejectReason
	if isnull(@max_id,'') > 0 
	begin
	    set @seq_obj = 'LRR'

		update [Sequence] set last_id = @max_id where seq_object = @seq_obj
		
		if @@ROWCOUNT = 0 insert into [Sequence] values (@seq_obj,@max_id)
	end
	-- loan reject reason

	-- loan closure reason
	select @max_id = max(reason_id) from T_LoanCloseReason
	if isnull(@max_id,'') > 0 
	begin
	    set @seq_obj = 'LSR'

		update [Sequence] set last_id = @max_id where seq_object = @seq_obj
		
		if @@ROWCOUNT = 0 insert into [Sequence] values (@seq_obj,@max_id)
	end
	-- loan closure reason


	/*case when @seq_object = 'ENT' then 10001 -- entity
				 when @seq_object = 'GRP' then 101   -- group
				 when @seq_object = 'EML' then 101   -- employer
				 when @seq_object = 'BNK' then 101  -- bank
				 when @seq_object = 'DSG' then 101 -- designation
				 when @seq_object = 'LNC' then 1001 -- loan class
				 when @seq_object = 'LON' then 10000001 -- loan
				 when @seq_object = 'CMP' then 101 -- competitor
				 when @seq_object = 'PRP' then 101 -- purpose
				 when @seq_object = 'ACT' then 101 -- account type
				 when @seq_object = 'LNT' then 101 -- loan type
				 when @seq_object = 'LCR' then 201 -- loan cancellation reason
				 when @seq_object = 'LRR' then 201 -- loan rejection reason
				 when @seq_object = 'LSR' then 201 -- loan closure reason
				 when @seq_object = 'PAY' then 100000001 -- payment
				 when @seq_object = 'LDG' then 1 -- ledger
				 when @seq_object = 'ITS' then 100000001 -- interest
				 else 0
	*/

END

GO
/****** Object:  StoredProcedure [dbo].[sp_gen_id]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_gen_id]
(
	@seq_object char(3)
)
as
begin
	set xact_abort on

	declare @id int

	select @id = last_id + 1
	  from dbo.Sequence (nolock)
	 where seq_object = @seq_object
	 
	 if isnull(@id,0) = 0 
	 begin
	    select @id = 
			case when @seq_object = 'ENT' then 10001 -- entity
				 when @seq_object = 'GRP' then 101   -- group
				 when @seq_object = 'EML' then 101   -- employer
				 when @seq_object = 'BNK' then 101  -- bank
				 when @seq_object = 'DSG' then 101 -- designation
				 when @seq_object = 'LNC' then 1001 -- loan class
				 when @seq_object = 'LON' then 10000001 -- loan
				 when @seq_object = 'CMP' then 101 -- competitor
				 when @seq_object = 'PRP' then 101 -- purpose
				 when @seq_object = 'ACT' then 101 -- account type
				 when @seq_object = 'LNT' then 101 -- loan type
				 when @seq_object = 'LCR' then 201 -- loan cancellation reason
				 when @seq_object = 'LRR' then 201 -- loan rejection reason
				 when @seq_object = 'LSR' then 201 -- loan closure reason
				 when @seq_object = 'PAY' then 100000001 -- payment
				 when @seq_object = 'LDG' then 1 -- ledger
				 when @seq_object = 'ITS' then 100000001 -- interest
				 else 0
			end

		insert into Sequence values (@seq_object, @id)

	 end
	 else
	 begin
		-- update the ID
		update Sequence
		   set last_id = @id
		 where seq_object = @seq_object
	 end

	 set xact_abort off

	 select last_id
	   from Sequence
	  where seq_object = @seq_object  
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_acct_types]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_get_acct_types]
AS
BEGIN
	select *
	  from T_AccountType T (nolock)
  order by T.acct_type_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_bank_branches]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_get_bank_branches]
AS
BEGIN
	select *,
	       (select bank_name from T_Bank T (nolock) where T.bank_code = B.bank_code) bank_name
	  from Bank (nolock) B 
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_banks]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_get_banks]
as
BEGIN
	select *
	  from T_Bank (nolock) B
  order by B.bank_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_clients]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_get_clients]
	@filter_type int = 0,
	@non_clients int = 0
AS
BEGIN
	-- filter types
	-- 0 = all
	-- 1 = active
	-- 2 = recent

	declare @sql varchar(max),
	        @where varchar(500),
			@order varchar(100) = ' order by name'

	set @sql = 'select (case when E.entity_type = ''CL'' then E.entity_id when isnull(active_loans,0) > 0 then E.entity_id else ''*****'' end) display_id,
					   E.entity_id,
					   (P.lastname + '', '' + P.firstname + '' '' + substring(isnull(P.middlename,''''),1,1)) name,
					   P.lastname,
					   P.firstname,
					   P.middlename,
					   C.acct_no,
					   C.card_no
				  from Entity E (nolock)
				  join PersonalInfo P (nolock)
					on P.entity_id = E.entity_id 
			 left join AcctInfo C (nolock)
			        on C.entity_id = P.entity_id
			 left join #ActiveLoans A
			        on A.entity_id = E.entity_id'

	 -- get active loans
	 select count(*) active_loans,
	        entity_id
	   into #ActiveLoans
	   from Loan L (nolock)
	  where L.status_id = 'R'
   group by entity_id

	 -- where clause
	 select @where = (
						case when @filter_type = 0 then 
								  case when @non_clients = 0 then ' where E.entity_type = ''CL''' 
								  else '' end

						     when @filter_type = 1 then 
								  case when @non_clients = 0 then ' where isnull(active_loans,0) > 0' 
								  else ' where isnull(active_loans,0) >= 0'  end

							 when @filter_type = 2 then 
								  case when @non_clients = 0 then ' where cast(created_date as date) = cast(getdate() as date) and E.entity_type = ''CL'''
								  else ' where cast(created_date as date) = cast(getdate() as date)' end

							 else ''
						end

					 )

	set @sql = @sql + @where + @order
	
	execute(@sql)

	drop table #ActiveLoans

END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_comakers]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_get_comakers]
AS
BEGIN
	-- filter types
	-- 0 = all
	-- 1 = pending = P
	-- 2 = assessed = S
	-- 3 = approved = A
	-- 4 = active / released = R
	-- 5 = cancelled = C
	-- 6 = denied / rejected = J

	-- get current comakers
	select count(1) comakered_loans,
	       C.entity_id
	  into #Comakers
	  from Loan L (nolock)
	  join LoanComaker C (nolock)
	    on L.loan_id = C.loan_id
     where L.status_id in ('R','A','P','S')
  group by C.entity_id
	       
	select E.entity_id,
	       (P.lastname + ', ' + P.firstname + ' ' + substring(isnull(P.middlename,''),1,1)) name,
		   P.lastname,
		   P.firstname,
		   P.middlename,
		   isnull(C.comakered_loans,0) comakered_loans
	  from Entity E (nolock)
	  join PersonalInfo P (nolock)
	    on P.entity_id = E.entity_id
 left join #Comakers C (nolock)
        on C.entity_id = E.entity_id
  order by name

  drop table #Comakers
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_competitors]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_get_competitors]
AS
BEGIN
	select *
	  from Competitor C (nolock)
  order by comp_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_designations]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_get_designations]
AS
BEGIN
	select *
	  from T_Designation (nolock)
  order by designation
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_duplicate_name]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_get_duplicate_name]
    @lastname varchar(50),
	@firstname varchar(50),
	@middlename varchar(50)
AS
BEGIN
	-- this procedure is developed to detect POTENTIAL duplicates
	-- returns a list of the potential duplicates
	declare @name varchar(100)

	set @name = @lastname + ', ' + @firstname

	-- get active loans
	 select count(*) active_loans,
	        entity_id
	   into #ActiveLoans
	   from Loan L (nolock)
	  where L.status_id = 'R'
   group by entity_id

	select (P.lastname + ', ' + P.firstname + isnull(' ' + P.middlename,'')) name,
	       (case when E.entity_type = 'CL' then E.entity_id when isnull(active_loans,0) > 0 then E.entity_id else '*****' end) display_id,
		   P.entity_id 
	  from PersonalInfo P (nolock)
	  join Entity E (nolock)
	    on E.entity_id = P.entity_id
 left join #ActiveLoans A
	    on A.entity_id = E.entity_id
	 where (soundex(@lastname) = soundex(P.lastname)
	   and (soundex(@firstname) = soundex(P.firstname))
	   and (soundex(@middlename) = soundex(P.middlename)))

	   --or (difference(@name,P.lastname + ', ' + P.firstname) in (3,4))
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_employers]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_get_employers]
AS
BEGIN
	select E.*,
	       G.grp_name
	  from Employer E (nolock)
	  join [Group] G (nolock)
	    on G.grp_id = E.grp_id
  order by E.emp_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_entities]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_get_entities]
	@entity_type char(2) = 'CL'
AS
BEGIN
	select E.entity_id,
	       (P.lastname + ', ' + P.firstname + ' ' + substring(isnull(P.middlename,''),1,1)) name,
		   P.lastname,
		   P.firstname,
		   P.middlename,
		   C.mobile_no,
		   C.home_phone
	  from Entity E (nolock)
	  join PersonalInfo P (nolock)
	    on P.entity_id = E.entity_id
 left join ContactInfo C (nolock)
        on C.entity_id = E.entity_id
     -- where isnull(@entity_type,'') = '' 
	 --   or E.entity_type = @entity_type
  order by name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_group_attributes]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_group_attributes]
AS
BEGIN
	select *
	  from GroupAttribute A (nolock)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_groups]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_get_groups]	
AS
BEGIN
	select *
	  from [Group] (nolock) G
  order by par_grp_id, grp_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_info_sources]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_get_info_sources]
AS
BEGIN
	select *
	  from T_InfoSource (nolock)
  order by source_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_loan_cancel_reasons]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_get_loan_cancel_reasons]
AS
BEGIN
	select *
	  from T_LoanCancelReason C (nolock)
  order by C.reason_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_loan_class]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_loan_class]
AS
BEGIN
	select C.*,
	       dbo.udf_format_currency(C.int_rate) int_rate_f,
	       dbo.udf_format_currency(C.max_loan) max_loan_f,
	       G.grp_name,
		   A.loan_type,
	       T.loan_type_name,
		   T.max_concurrent,
		   T.max_tot_amt,
		   M.display as comp_method
	  from LoanClass (nolock) C
	  join dbo.fxn_get_int_comp_method () M
	    on M.value = C.int_comp_method
	  join [Group] (nolock) G
	    on G.grp_id = C.grp_id
 left join GroupAttribute A
	    on A.grp_id = G.grp_id
 left join T_LoanType (nolock) T
	    on T.loan_type = A.loan_type
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_loan_class_advance_payment]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_get_loan_class_advance_payment]
	@class_id int
AS
BEGIN
	select *
	  from LoanClassAdvance (nolock)
	 where class_id = @class_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_loan_class_charge_types]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
CREATE PROCEDURE [dbo].[sp_get_loan_class_charge_types]
AS
BEGIN
	select *
	  from T_ChargeType (nolock)
  order by charge_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_loan_class_charges]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_get_loan_class_charges]
	@class_id int
AS
BEGIN
	select C.*,
	       T.charge_name,
		   (dbo.udf_format_currency(C.charge_value) + (case when C.value_type = 1 then '%' else '' end)) charge_value_f,
		   (dbo.udf_format_currency(C.ratio_amt)) ratio_amt_f,
		   (dbo.udf_format_currency(C.max_value)) max_value_f,
		   (case when isnull(for_new,0) = 0 then 'No' else 'Yes' end) for_new_f,
		   (case when isnull(for_renew,0) = 0 then 'No' else 'Yes' end) for_renew_f,
		   (case when isnull(for_restructure,0) = 0 then 'No' else 'Yes' end) for_restructure_f,
		   (case when isnull(for_reloan,0) = 0 then 'No' else 'Yes' end) for_reloan_f
	  from LoanClassCharge C (nolock)
	  join T_ChargeType T (nolock)
	    on T.charge_type = C.charge_type
	 where C.class_id = @class_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_loan_clients]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_get_loan_clients]
AS
BEGIN
	declare @cd datetime

	set @cd = getdate()

	select P.entity_id,
	       (P.lastname + ', ' + P.firstname + ' ' + substring(isnull(P.middlename,''),1,1)) name,
		   Y.emp_id,
		   Y.emp_name,
		   Y.grp_id,
		   Y.emp_add,
		   G.grp_name,
		   (isnull(D.st + ' ','') + isnull(brgy,'')) client_addr,
		   (case when dateadd(year, datediff (year, P.birth_date, @cd), P.birth_date) > @cd
			then datediff (year, P.birth_date, @cd) - 1
			else datediff (year, P.birth_date, @cd)
			end) age,
			E.net_pay,
			(
				select count(*) 
				  from IdentityInfo I (nolock)
				 where I.entity_id = P.entity_id
				   and isnull(I.exp_date,getdate()) >= getdate()

			) valid_ident_docs
	  from PersonalInfo P (nolock)
 left join AddressInfo D (nolock)
        on D.entity_id = P.entity_id
	   and isnull(is_prov,0) = 0
 left join EmplInfo E (nolock)
        on E.entity_id = P.entity_id
 left join Employer Y (nolock)
        on E.emp_id = Y.emp_id
 left join [Group] G (nolock)
        on G.grp_id = Y.grp_id
  order by P.lastname, P.firstname
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_loan_close_reasons]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_get_loan_close_reasons]
AS
BEGIN
	select *
	  from T_LoanCloseReason C (nolock)
  order by C.reason_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_loan_reject_reasons]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_get_loan_reject_reasons]
AS
BEGIN
	select *
	  from T_LoanRejectReason R (nolock)
  order by R.reason_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_loan_types]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_get_loan_types]
AS
BEGIN
	select *,
	       A.acct_type_name
	  from T_LoanType T (nolock)
	  join T_AccountType A (nolock)
	    on A.acct_type = T.acct_type
  order by T.loan_type_name
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_loans]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_get_loans]
	@filter_type int = 0
AS
BEGIN
	-- filter types
	-- 0 = all
	-- 1 = pending = P
	-- 2 = assessed = S
	-- 3 = approved = A
	-- 4 = active / released = R
	-- 5 = cancelled = C
	-- 6 = denied / rejected = J
	-- 7 = closed = X

	declare @sql varchar(max),
	        @where varchar(500),
			@order varchar(100) = ' order by name'

	set @sql = 'declare @cd datetime

				set @cd = getdate()
	
				select L.*,
	                   dbo.udf_format_date(date_appl) date_appl_f,
					   dbo.udf_format_date(date_appv) date_appv_f,
	                   dbo.udf_format_currency(amt_appl) amt_appl_f,
					   dbo.udf_format_currency(amt_appv) amt_appv_f,
					   dbo.udf_format_currency(balance) balance_f,
					   (P.lastname + '', '' + P.firstname + '' '' + substring(isnull(P.middlename,''''),1,1)) name,
                       C.class_name,
					   Y.emp_id,
		               Y.emp_name,
		               Y.grp_id,
		               Y.emp_add,
		               (isnull(D.st + '' '','''') + isnull(brgy,'''')) client_addr,
					   (
							case when dateadd(year, datediff (year, P.birth_date, @cd), P.birth_date) > @cd
							then datediff (year, P.birth_date, @cd) - 1
							else datediff (year, P.birth_date, @cd)
							end
					   ) age,
					   E.net_pay,
					   (
							select count(*) 
							  from IdentityInfo I (nolock)
							 where I.entity_id = P.entity_id
							   and isnull(I.exp_date,getdate()) >= getdate()

					   ) valid_ident_docs
				  from Loan L (nolock)
				  join PersonalInfo P (nolock)
					on P.entity_id = L.entity_id 
			 left join AddressInfo D (nolock)
                    on D.entity_id = P.entity_id
				   and isnull(D.is_prov,0) = 0
             left join EmplInfo E (nolock)
                    on E.entity_id = P.entity_id
             left join Employer Y (nolock)
                    on E.emp_id = Y.emp_id
				  join LoanClass C (nolock)
				    on C.class_id = L.class_id 
			 left join LoanAppv A (nolock)
			        on A.loan_id = L.loan_id '

	 -- where clause
	 select @where = (
						case when @filter_type = 0 then '' 
						     when @filter_type = 1 then ' where L.status_id = ''P'''
							 when @filter_type = 2 then ' where L.status_id = ''S'''
							 when @filter_type = 3 then ' where L.status_id = ''A'''
							 when @filter_type = 4 then ' where L.status_id = ''R'''
							 when @filter_type = 5 then ' where L.status_id = ''C'''
							 when @filter_type = 6 then ' where L.status_id = ''J'''
							 when @filter_type = 7 then ' where L.status_id = ''X'''
							 else ''
						end

					 )

	set @sql = @sql + @where + @order
	
	execute(@sql)

END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_purpose]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_get_purpose]
AS
BEGIN
	select *
	  from T_Purpose (nolock)
  order by purpose
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ln_get_active_loans]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ln_get_active_loans]
AS
BEGIN
	select loan_id
	       int_deficit,
	       prc_deficit
	  from Loan L (nolock)
	 where L.status_id = 'R'
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ln_get_advance_payment]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ln_get_advance_payment]
	@loan_id char(13)
AS
BEGIN
	select D.payment_id,
	       D.payment_amt,
	       D.payment_type
	  from PaymentDetail D (nolock)
	  join Payment P (nolock)
	    on P.payment_id = D.payment_id
	 where D.loan_id = @loan_id
	   and isnull(P.is_advance,0) = 1
  order by D.payment_id, 
           D.payment_type

  -- !!! WARNING Don't tinker with the sorting
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ln_get_alerts]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ln_get_alerts]
	@entity_id char(10),
	@loan_id char(13) -- exclude from the select
AS
BEGIN
	declare @ids int,
			@expired_ids int,
			@pending_loans int,
			@approved_loans int,
			@active_loans int

	declare @alerts table
	(
		alert varchar(100)
	)

	-- pending = P
	-- assessed = S
	-- approved = A
	-- active / released = R
	-- cancelled = C
	-- denied / rejected = J

	-- get identity docs
	select @ids = count(*)
	  from IdentityInfo I (nolock)
	 where I.entity_id = @entity_id

	-- find expired identity docs
	select @expired_ids = count(*)
	  from IdentityInfo I (nolock)
	 where I.entity_id = @entity_id
	   and isnull(I.exp_date,getdate()) < getdate()

	-- find loans
    -- only include pending, approved and active
	select loan_id, status_id
	  into #Loan
	  from Loan (nolock)
	 where entity_id = @entity_id
	   and status_id in ('P','A','R')
	   and loan_id <> @loan_id

	select count(*) as total, status_id
	  into #LoanStatusTotal
	  from #Loan
  group by status_id

	-- identity docs
	if isnull(@ids,0) < 2 insert into @alerts select 'Applicant has not submitted the required number of identity documents.' as alert

	-- expired identity docs
	if isnull(@expired_ids,0) > 0 insert into @alerts select 'Applicant has expired identity documents.' as alert
	
	-- pending loans
	set @pending_loans = (select total from #LoanStatusTotal where status_id = 'P')
	if isnull(@pending_loans,0) > 0 insert into @alerts select 'Applicant has ' + cast(@pending_loans as varchar) + 
	case when @pending_loans = 1 then ' pending loan.' else ' pending loans.' end as alert

	-- approved loans
	set @approved_loans = (select total from #LoanStatusTotal where status_id = 'A')
	if isnull(@approved_loans,0) > 0 insert into @alerts select 'Applicant has ' + cast(@approved_loans as varchar) + 
	case when @approved_loans = 1 then ' approved loan.' else ' approved loans.' end as alert

	-- active/released loans
	set @active_loans = (select total from #LoanStatusTotal where status_id = 'R')
	if isnull(@active_loans,0) > 0 insert into @alerts select 'Applicant has ' + cast(@active_loans as varchar) + 
	case when @active_loans = 1 then ' active loan.' else ' active loans.' end as alert

	select *
	  from @alerts

	drop table #Loan
	drop table #LoanStatusTotal

END

GO
/****** Object:  StoredProcedure [dbo].[sp_ln_get_client_loans]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ln_get_client_loans]
	@entity_id char(10)
AS
BEGIN
	-- pending = P
	-- assessed = S
	-- approved = A
	-- active / released = R
	-- cancelled = C
	-- denied / rejected = J

	select loan_id,
		   class_id,
		   (case status_id 
				when 'P' then amt_appl -- set balance to amount applied when status is PENDING
				else balance
		   end) balance
	  from Loan L (nolock)
	 where L.entity_id = @entity_id
	   and L.status_id in ('P','S','A','R')
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ln_get_fin_info]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ln_get_fin_info]	
	@loan_id char(13)
AS
BEGIN
	select A.*,
	       C.comp_name,
		   dbo.udf_format_currency(A.mon_due) mon_due_f,
		   dbo.udf_format_currency(A.loan_bal) loan_bal_f   
	  from LoanAssFinInfo A (nolock)
	  join Competitor C (nolock)
	    on C.comp_id = A.comp_id
	 where A.loan_id = @loan_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ln_get_interests]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ln_get_interests]
	@loan_id char(15)
AS
BEGIN
	select *
	  from Interest (nolock)
	 where loan_id = @loan_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ln_get_ledger]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ln_get_ledger]
	@loan_id char(13),
	@as_of_date datetime
AS
BEGIN
	declare @Ledger table 
	(
		id varchar(20),
		due datetime,
		document_no char(25),
		debit_amt_p decimal(10,2),
		credit_amt_p decimal(10,2),
		balance_p decimal(10,2),
		debit_amt_i decimal(10,2),
		credit_amt_i  decimal(10,2),
		balance_i decimal(10,2),
		sort_order smallint
	)

	declare @release_date datetime,
	        @principal_deficit decimal(10,2),  -- total deficit
			@interest_deficit decimal(10,2)    -- total deficit.. for each payment deficit.. use the balance field

	-- get release date
	select @release_date = date_rel,
	       @principal_deficit = prc_deficit,
		   @interest_deficit = int_deficit 
	  from LoanRelease R (nolock) 
	  join Loan L (nolock)
	    on L.loan_id = R.loan_id
	 where R.loan_id = @loan_id


	-- get everything related to the loan
	-- payment, interest, penalty, etc..

	-- principal
	select *
	  into #Principal
	  from Ledger (nolock)
	 where event_object = 'LON'
	   and pk_event_object = @loan_id
	   and case_type = 'PRC'
	   --and value_date <= @as_of_date

	-- interest
	select *
	  into #Interest
	  from Interest (nolock)
	 where loan_id = @loan_id
	   and interest_status_id = 'T'
	   and interest_date <= @as_of_date
  order by interest_date

	-- all payments
	select P.payment_id,
	       P.payment_date,
		   P.pmt_method,
		   P.receipt_no,
	       D.payment_amt,
		   D.payment_type,
		   D.balance,
		   P.is_advance
	  into #Payment
	  from Payment P (nolock)
	  join PaymentDetail (nolock) D
	    on D.payment_id = P.payment_id
     where D.loan_id = @loan_id
       and isnull(D.is_cancelled,0) = 0
	   and P.payment_date <= @as_of_date

	-- ***** construct the return query
	-- release amount
	insert into @Ledger
	select 'L' + loan_id,
	       date_rel,
	       @loan_id,
		   0,
		   0,
		   -- released amount // note: released amount is the net proceeds
		   rel_amt + 
		   isnull((select sum(charge_amt) from LoanCharge LC (nolock) where LC.loan_id = @loan_id),0) + 
		   isnull((select sum(payment_amt) from #Payment P where isnull(P.is_advance,0) = 1),0), 
		   -- released amount
		   0,
		   0,
		   0,
		   1 sort_order       
	  from LoanRelease (nolock)
	 where loan_id = @loan_id

	-- principal with or without corresponding interest, with or without payment
	-- DO NOT include advance payment
	insert into @Ledger
	select 'P' + PP.payment_id,
		   P.value_date,
		   rtrim(coalesce(PP.receipt_no,PN.receipt_no)) + (case isnull(PP.pmt_method,PN.pmt_method) when 3 then '*' else '' end),
		   isnull(P.debit_amt,0),
		   isnull(PP.payment_amt,0),
		   isnull(PP.balance,0),
		   isnull(I.interest_amt,0),
		   isnull(PN.payment_amt,0),
		   coalesce((case when (I.interest_date = datediff(day,-1,@as_of_date)) or (I.interest_date = P.value_date) then I.interest_amt else 0 end),PN.balance,0),
		   1 sort_order
	   from #Principal P
  left join #Interest I
         on I.interest_date = P.value_date
  left join #Payment PP
         on PP.payment_date = P.value_date
		and PP.payment_type = 'PRN' 
		-- and PP.is_advance = 0
  left join #Payment PN
         on PN.payment_date = I.interest_date
		and PN.payment_type = 'INT'
		-- and PN.is_advance = 0
	  where P.value_date > @release_date

	-- advance payment
	insert into @Ledger
	select 'P' + PN.payment_id,
	       PN.payment_date,
		   rtrim(coalesce(P.receipt_no,PN.receipt_no)),
		   P.payment_amt,
		   P.payment_amt,
		   P.balance,
		   PN.payment_amt,
		   PN.payment_amt,
		   PN.balance,
		   2 sort_order
	   from #Payment PN
  left join #Payment P
         on PN.payment_id = P.payment_id
		and P.payment_type = 'PRN'
	  where PN.payment_type = 'INT' 
	    and PN.payment_date = @release_date

	-- interest without principal, with or without payment
	-- NOTE: in the CASE statement below.. checks for payment done on the same day .. do not show the interest amount after the first payment
	insert into @Ledger
	select coalesce('P' +  PP.payment_id,'P' + PN.payment_id,'I' + I.interest_id),
		   I.interest_date, 
	       rtrim(PN.receipt_no)  + (case PN.pmt_method when 1 then '*' else '' end),
	       0,
		   isnull(PP.payment_amt,0),
		   isnull(PP.balance,0),
		   (case when PN.payment_id in (select max(T.payment_id) from #Payment T where T.payment_type = 'INT' group by T.payment_date having count(1) > 1) then 0 
				 else isnull(I.interest_amt,0) end),
		   isnull(PN.payment_amt,0),
		   coalesce(PN.balance,(case when I.interest_date < @as_of_date then I.interest_amt else 0 end),0),
		   2
	  from #Interest I
  left join #Payment PN
         on PN.payment_date = I.interest_date
		and PN.payment_type = 'INT'
 left join #Payment PP
         on PP.payment_date = I.interest_date
		and PP.payment_type = 'PRN' 
		and PP.payment_id = PN.payment_id
	  where I.interest_date not in (select due from @Ledger)

	-- unscheduled payments
	-- can include payments for fixed accounts or diminishing scheduled
	-- these accounts are posted on the first day of each month
	insert into @Ledger
	select coalesce('P' + PP.payment_id,'P' + PN.payment_id),
	       PP.payment_date,
	       rtrim(PP.receipt_no)  + (case PP.pmt_method when 1 then '*' else '' end),
	       0,
		   isnull(PP.payment_amt,0),
		   isnull(PP.balance,0),
		   0,
		   isnull(PN.payment_amt,0),
		   isnull(PN.balance,0),
		   2
	  from #Payment PP
 left join #Payment PN
        on PN.payment_id = PP.payment_id
	   and PN.payment_type = 'INT' 
	 where PP.payment_type = 'PRN'
	   and coalesce('P' + PP.payment_id,'P' + PN.payment_id) not in (select id from @Ledger where id is not null)

	--  select * from #Principal
	--  select * from #Interest
	--  select * from #Payment

	-- result
	select *,
	       @principal_deficit principal_deficit,
		   @interest_deficit  interest_deficit
	  from @Ledger
  order by due,
	       sort_order

	drop table #Interest
	drop table #Principal
	drop table #Payment

END

GO
/****** Object:  StoredProcedure [dbo].[sp_ln_get_loan]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ln_get_loan]
	@loan_id char(13)
AS
BEGIN
	select *
	  from Loan (nolock) L
	 where L.loan_id = @loan_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ln_get_loan_appv]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ln_get_loan_appv]
	@loan_id char(13)
AS
BEGIN
	select A.*,
	       dbo.udf_format_currency(amt_appv) amt_appv_f,
		   dbo.udf_format_date(date_appv) date_appv_f,
	       M.display as method_name
	  from LoanAppv (nolock) A
	  join dbo.fxn_get_appv_method() M
	    on M.value = A.appv_method
	 where A.loan_id = @loan_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ln_get_loan_ass]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ln_get_loan_ass]
	@loan_id char(13)
AS
BEGIN
	select *,
	       dbo.udf_format_date(date_ass) date_ass_f,
		   dbo.udf_format_currency(rec_amt) rec_amt_f,
		   R.display recommendation
	  from LoanAss (nolock) A
	  join dbo.fxn_get_recommendation() R
	    on R.value = A.rec_code
	 where A.loan_id = @loan_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ln_get_loan_cancel]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ln_get_loan_cancel]
	@loan_id char(13)
AS
BEGIN
	select C.*,
	       dbo.udf_format_date(cancelled_date) cancelled_date_f,
	       R.reason_name
	  from LoanCancel (nolock) C
	  join T_LoanCancelReason R (nolock)
	    on R.reason_id = C.reason_id
	 where C.loan_id = @loan_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ln_get_loan_charges]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ln_get_loan_charges]
	@loan_id char(13)
AS
BEGIN
	select C.*,
	       charge_name,
	       dbo.udf_format_currency(charge_amt) charge_amt_f
	  from LoanCharge C (nolock)
	  join T_ChargeType T (nolock)
	    on T.charge_type = C.charge_type
	 where C.loan_id = @loan_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ln_get_loan_class_advance]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ln_get_loan_class_advance]
	@entity_id char(10)
AS
BEGIN
	declare @class_access table
	(
		class_id int
	)

	-- add class id from EntityLoanClass
	/*insert into @class_access
	select class_id
	  from EntityLoanClass E (nolock)
	 where E.entity_id = @entity_id*/

	-- add class id from LoanClass
	insert into @class_access
	select class_id
	  from LoanClass (nolock) C
	 where C.grp_id = (select M.grp_id 
	                     from EmplInfo E (nolock) 
						 join Employer M (nolock)
						   on M.emp_id = E.emp_id
						where E.entity_id = @entity_id)

	-- add class id from EntityGroup
	insert into @class_access
	select C.class_id
	  from EntityGroup E (nolock)
	  join LoanClass C (nolock)
		on C.grp_id = E.grp_id
	 where E.entity_id = @entity_id

	-- return
	select A.*
	  from LoanClassAdvance A (nolock)
	 where A.class_id in (select * from @class_access)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ln_get_loan_class_charges]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ln_get_loan_class_charges]
	@entity_id char(10)
AS
BEGIN
	declare @class_access table
	(
		class_id int
	)

	-- add class id from EntityLoanClass
	/*insert into @class_access
	select class_id
	  from EntityLoanClass E (nolock)
	 where E.entity_id = @entity_id*/

	-- add class id from LoanClass
	insert into @class_access
	select class_id
	  from LoanClass (nolock) C
	 where C.grp_id = (select M.grp_id 
	                     from EmplInfo E (nolock) 
						 join Employer M (nolock)
						   on M.emp_id = E.emp_id
						where E.entity_id = @entity_id)

	-- return
	select C.*,
	       T.charge_name
	  from LoanClassCharge C (nolock)
	  join T_ChargeType T (nolock)
	    on T.charge_type = C.charge_type
	 where C.class_id in (select * from @class_access)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ln_get_loan_close]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ln_get_loan_close]
	@loan_id char(13)
AS
BEGIN
	select C.*,
	       dbo.udf_format_date(date_closed) date_closed_f,
	       R.reason_name
	  from LoanClose (nolock) C
	  join T_LoanCloseReason R (nolock)
	    on R.reason_id = C.reason_id
	 where C.loan_id = @loan_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ln_get_loan_comakers]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ln_get_loan_comakers]
	@loan_id char(13)
AS
BEGIN
	select C.*,
	       (P.lastname + ', ' + P.firstname) name
	  from LoanComaker C (nolock)
	  join PersonalInfo P (nolock)
	    on P.entity_id = C.entity_id
	 where loan_id = @loan_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ln_get_loan_reject]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ln_get_loan_reject]
	@loan_id char(13)
AS
BEGIN
	select J.*,
	       dbo.udf_format_date(date_rejected) date_rejected_f,
	       R.reason_name
	  from LoanReject (nolock) J
	  join T_LoanRejectReason R (nolock)
	    on R.reason_id = J.reason_id
	 where J.loan_id = @loan_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ln_get_loan_release]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ln_get_loan_release]
	@loan_id char(13)
AS
BEGIN
	select R.*,
	       dbo.udf_format_currency(R.rel_amt) rel_amt_f,
		   dbo.udf_format_date(date_rel) date_rel_f,
	       M.display method_name,
		   (P.lastname + ', ' + P.firstname) as recipient_name
	  from LoanRelease (nolock) R
	  join dbo.fxn_get_release_method() M
	    on R.rel_method = M.value
	  join PersonalInfo P
	    on P.entity_id = R.recipient
	 where R.loan_id = @loan_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ln_get_mon_exp]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ln_get_mon_exp]
	@loan_id char(13)
AS
BEGIN
	select M.*,
	       E.exp_name,
		   dbo.udf_format_currency(M.monthly) monthly_f
	  from LoanAssMonExp M (nolock)
	  join T_ExpenseType E (nolock)
	    on E.exp_type = M.exp_type
	 where M.loan_id = @loan_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ln_get_payment_due]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ln_get_payment_due]
	@loan_id char(13)
AS
BEGIN
	declare @payments smallint

	-- loan detail
	select *
	  into #Loan
	  from Loan (nolock)

    -- get interest
	select I.*
	  into #InterestSchedule
	  from Interest I (nolock)
	 where I.loan_id = @loan_id

	-- ** retrieve OPN ledger records
	-- this is for payment posting
	-- open principal
	select L.posting_id,
	       L.value_date,
		   L.post_date,
		   L.case_type,
		   L.debit_amt,
		   L.pk_event_object,
		   L.event_object,
		   L.status_code
	  into #Principal 
	  from Ledger (nolock) L
	 where L.event_object = 'LON'
	   -- and L.status_code = 'OPN'
	   and L.pk_event_object = @loan_id

	-- get interest posted in Ledger
	select L.posting_id,
	       L.value_date,
		   L.post_date,
		   L.case_type,
		   L.debit_amt,
		   L.pk_event_object,
		   L.event_object,
		   L.status_code
	  into #Interest 
	  from Ledger (nolock) L
	  join #InterestSchedule I
	    on I.interest_id = L.pk_event_object
	 where L.event_object = 'ITR'
	   -- and L.status_code = 'OPN'

	-- retrieve all payments made to the OPN records
	-- retrieved for balance purposes
	select sum(credit_amt) amount_paid,
		   ref_posting_id
	  into #Payment
	  from Ledger (nolock) L
	 where L.event_object = 'PAY'
	   and L.status_code <> 'CNL'
	   and ((L.ref_posting_id in (select posting_id from #Principal))
	        or (L.ref_posting_id in (select posting_id from #Interest)))
  group by ref_posting_id


	-- return query
	select R.*, isnull(@payments,0) payments
	  from (
				select P.posting_id,
					   P.value_date,
					   P.post_date,
					   P.case_type,
					   P.debit_amt amortisation,
					   (P.debit_amt - isnull(Y.amount_paid,0)) payment_due,
					   P.pk_event_object,
					   P.event_object,
					   P.status_code,
					   (case when isnull(Y.amount_paid,0) = 0 then 0 else 1 end) has_partial 
				  from #Principal P
			 left join #Payment Y
					on Y.ref_posting_id = P.posting_id

				union

				select I.posting_id,
					   I.value_date,
					   I.post_date,
					   I.case_type,
					   (select interest_amt
					      from #InterestSchedule S
						 where S.interest_date between I.value_date and dateadd(s, -1, dateadd(m, datediff(m, 0, I.value_date)+1, 0)) -- eomonth(I.value_date)
						   and S.interest_src = 'SYS' 
					   ) amortisation,
					   (I.debit_amt - isnull(P.amount_paid,0)) payment_due,
					   I.pk_event_object,
					   I.event_object,
					   I.status_code,
					   (case when isnull(P.amount_paid,0) = 0 then 0 else 1 end) has_partial 
				  from #Interest I
			 left join #Payment P
					on P.ref_posting_id = I.posting_id
			 
				union

				-- unposted (pending) interest
				-- specifically for fixed diminishing
				-- NOTE: For then posting_id column.. do not leave blank.. the Posted property in the Ledger class checks for this column.. 
				--       Blank means application needs to post this in the Ledger table
				select '0' posting_id,
					   I.interest_date,
					   getdate() post_date,
					   'ITS',
					   I.interest_amt amortisation,
					   0 payment_due,
					   I.interest_id,
					   'ITR',
					   'OPN',
					   0 has_partial 
				  from #InterestSchedule I
				  join #Loan L
				    on L.loan_id = I.loan_id
				  join LoanClass LC (nolock)
				    on LC.class_id = L.class_id
				 where I.interest_status_id = 'P'
				   and LC.int_comp_method = 'D'
				   and LC.dim_type = 2
				   -- and I.interest_src = 'SYS'

			) R
	order by value_date

	-- select * from #Payment

	drop table #Principal
	drop table #Interest
	drop table #InterestSchedule
	drop table #Payment
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ln_get_payment_schedule]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ln_get_payment_schedule]
	@entity_id char(10)
AS
BEGIN
	-- get active loans
	select L.loan_id
	  into #Loans
	  from Loan L (nolock)
	 where L.entity_id = @entity_id
	   and L.status_id = 'R'

	-- get interests
	select interest_id
	  into #Interest
	  from Interest (nolock)
	 where loan_id in (select A.loan_id from #Loans A)

	-- retrieve OPN ledger records
	-- this is for payment posting
	 select L.posting_id,
			L.value_date,
			L.post_date,
			L.case_type,
			L.debit_amt,
			L.credit_amt,
			L.event_object,
			L.pk_event_object, 
			L.status_code
	   from Ledger (nolock) L
	  where ((L.event_object = 'LON'
		and L.pk_event_object in (select A.loan_id from #Loans A))
		 or (L.event_object = 'ITR'
		and L.pk_event_object in (select I.interest_id from #Interest I)))
		and L.status_code = 'OPN'
   order by L.value_date,
            L.post_date

	drop table #Loans
	drop table #Interest
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ln_get_scheduled_interest]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ln_get_scheduled_interest]
	@date datetime,
	@loan_id char(13) = null
AS
BEGIN
	select I.*,
	       L.balance,
		   C.int_rate
	  from Interest I (nolock)
	  join Loan L (nolock)
	    on L.loan_id = I.loan_id
	  join LoanClass C (nolock)
	    on C.class_id = L.class_id
	 where interest_date <= @date
	   and interest_status_id = 'P' 
	   and (isnull(@loan_id,'') = '' or I.loan_id = @loan_id)

	/*select I.*
	  from Interest I (nolock)
	  join Loan L (nolock)
	    on L.loan_id = I.loan_id
	  join LoanClass C (nolock)
	    on C.class_id = L.class_id
	 where interest_date <= @date
	   and interest_status_id = 'P'
	   and L.status_id = 'R'
	   and (C.int_comp_method = 'D' and isnull(C.use_factor_rate,0) = 0)

	union

	-- fixed or diminishing accounts but using factor rate
	select I.*
	  from Interest I (nolock)
	  join Loan L (nolock)
	    on L.loan_id = I.loan_id
	  join LoanClass C (nolock)
	    on C.class_id = L.class_id
	 where year(interest_date) = year(@date)
	   and month(interest_date) = month(@date)
	   and interest_status_id = 'P'
	   and L.status_id = 'R'
	   and (C.int_comp_method = 'F' 
	    or (C.int_comp_method = 'D' and isnull(C.use_factor_rate,0) = 1))*/

END

GO
/****** Object:  StoredProcedure [dbo].[sp_ln_update_deficits]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ln_update_deficits]	
	@as_of_date datetime
AS
BEGIN
	-- this routine updates the INTEREST and PRINCIPAL deficits based on amounts posted in the LEDGER table where value_date is a day before  "@as_of_date" variable 
	declare @before_as_of_date datetime

	-- subtract 1 day from @as_of_date
	set @before_as_of_date = dateadd(day,-1,@as_of_date)

	select L.loan_id
	  into #Loan
	  from Loan L (nolock)
	  join LoanRelease R (nolock)
	    on R.loan_id = L.loan_id
	 where L.status_id = 'R'
	   and isnull(L.last_trans_date,R.date_rel) < @as_of_date

	-- payments.. used to check if payment has been posted.. 
	-- disregard as defict has been updated during posting 
	select D.loan_id,
	       D.payment_type
	  into #Payment
	  from PaymentDetail D (nolock)
	  join Payment P (nolock)
	    on P.payment_id = D.payment_id
	 where P.payment_date = @before_as_of_date

	-- principal
	select pk_event_object,
	       debit_amt
	  into #Principal
	  from Ledger L (nolock)
	 where L.event_object = 'LON'
	   and L.case_type = 'PRC'
	   and pk_event_object in (select loan_id from #Loan)
	   and pk_event_object not in (select loan_id from #Payment where payment_type = 'PRN')
	   and value_date = @before_as_of_date 
	   and status_code <> 'CNL'

	-- interest
	select loan_id,
	       interest_amt
	  into #Interest
	  from Interest (nolock)
	 where loan_id in (select loan_id from #Loan)
	   and loan_id not in (select loan_id from #Payment where payment_type = 'INT')
	   and interest_src = 'SYS'
	   and interest_status_id = 'T'
	   and interest_date = @before_as_of_date

	-- select * from #Principal
	-- select * from #Interest

	-- update
	update L
	   set prc_deficit = isnull(prc_deficit,0) + isnull(P.debit_amt,0),
	       int_deficit = isnull(int_deficit,0) + isnull(I.interest_amt,0)
	  from Loan L 
 left join #Principal P
	    on P.pk_event_object = L.loan_id
 left join #Interest I
	    on I.loan_id = L.loan_id
	 where L.loan_id in (select loan_id from #Loan)
	
	drop table #Loan
	drop table #Principal
	drop table #Interest
	drop table #Payment

END

GO
/****** Object:  StoredProcedure [dbo].[sp_pmt_get_interests]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_pmt_get_interests]
	@entity_id char(10)
AS
BEGIN
	select L.loan_id
	  into #Loans
	  from Loan L (nolock)
	 where L.entity_id = @entity_id
	   and L.status_id = 'R'

	select *
	  from Interest (nolock)
	 where loan_id in (select L.loan_id from #Loans L)

    drop table #Loans
END

GO
/****** Object:  StoredProcedure [dbo].[sp_pmt_get_loans]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_pmt_get_loans]
	@entity_id char(10)
AS
BEGIN
	select L.loan_id,
	       L.balance,
		   L.prc_deficit,
		   L.int_deficit,
		   L.status_id,
		   L.last_trans_date
	  from Loan L (nolock)
	 where L.entity_id = @entity_id
	   and L.status_id = 'R'
END

GO
/****** Object:  StoredProcedure [dbo].[sp_pmt_get_payment]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
CREATE PROCEDURE [dbo].[sp_pmt_get_payment]
	@payment_id char(15)
AS
BEGIN
	select *
	  from Payment P (nolock)
	 where payment_id = @payment_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_pmt_get_payment_detail]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
CREATE PROCEDURE [dbo].[sp_pmt_get_payment_detail]
	@payment_id char(15)
AS
BEGIN
    select *
	  into #Ledger
	  from Ledger L (nolock)
	 where event_object = 'PAY'
	   and pk_event_object = @payment_id

	select D.*,
	       T.loan_type_name,
		   Y.acct_type_name,
		   L.Balance
	  from PaymentDetail D (nolock)
	  join Loan L (nolock)
	    on L.loan_id = D.loan_id
      join LoanClass C (nolock)
	    on C.class_id = L.class_id
	  join dbo.fxn_get_parent_group() P
	    on P.grp_id = C.grp_id
	  join GroupAttribute A (nolock)
	    on A.grp_id = P.top_grp_id
	  join T_LoanType T (nolock)
	    on T.loan_type = A.loan_type 
	  join T_AccountType Y (nolock)
	    on Y.acct_type = T.acct_type
	 where payment_id = @payment_id
  order by D.loan_id

  drop table #ledger
END

GO
/****** Object:  StoredProcedure [dbo].[sp_pmt_get_payments]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_pmt_get_payments]
	@from_date datetime,
	@until_date datetime
AS
BEGIN
	-- payment head
	select *
	  into #payment
	  from Payment P (nolock)
	 where P.payment_date between @from_date and @until_date

	-- payment detail
	select payment_id,
	       payment_amt
	  into #paymentdetail
	  from PaymentDetail D (nolock)
	 where D.payment_id in (select P.payment_id from #payment P)

	-- result
	select P.*,
	       (F.lastname + ', ' + F.firstname) name,
	       (

				select sum(payment_amt)
				  from #paymentdetail D
				 where D.payment_id = P.payment_id

		   ) total_amount,
		   W.wd_amt
	  from #payment P
	  join PersonalInfo F (nolock)
	    on F.entity_id = P.entity_id
 left join BankWithdrawal W (nolock)
        on W.wd_id = P.wd_id

	drop table #payment
	drop table #paymentdetail
END

GO
/****** Object:  StoredProcedure [dbo].[sp_pmt_get_withdrawals]    Script Date: 7/06/2018 3:40:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_pmt_get_withdrawals]
AS
BEGIN
	select B.*,
	       P.entity_id,
	       (P.lastname + ', ' + P.firstname) client,
		   A.card_no,
		   dbo.udf_format_date(wd_date) wd_date_f,
	       dbo.udf_format_currency(wd_amt) wd_amt_f
	  from BankWithdrawal B (nolock)
	  join AcctInfo A (nolock)
	    on A.acct_no = B.acct_no
	  join PersonalInfo P (nolock)
	    on A.entity_id = P.entity_id
 left join Payment Y
        on Y.wd_id = B.wd_id
	 where isnull(Y.wd_id,'') = ''
END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Residence status' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AddressInfo', @level2type=N'COLUMN',@level2name=N'res_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Landlord of the rented property. Value is from the entity_id field of the Entity table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AddressInfo', @level2type=N'COLUMN',@level2name=N'landlord'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Immediate head. Value is the entity_id field from the Entity table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmplInfo', @level2type=N'COLUMN',@level2name=N'imm_head'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Driver''s license.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IdentityInfo', @level2type=N'COLUMN',@level2name=N'ident_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Source of interest posting. Either system-generated (SYS) or due to payment posting (PAY)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Interest', @level2type=N'COLUMN',@level2name=N'interest_src'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Posting status. P = Pending, T = Posted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Interest', @level2type=N'COLUMN',@level2name=N'interest_status_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Original value date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ledger', @level2type=N'COLUMN',@level2name=N'value_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Amount applied.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'amt_appl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Desired term.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'des_term'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Branch of origin. Where the application originated.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'orig_branch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Recommendation code. Can either be ''0'' approve application or ''1'' reject application' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LoanAss', @level2type=N'COLUMN',@level2name=N'rec_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of months to deduct. 0 means months to be determined upon release' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LoanClassAdvance', @level2type=N'COLUMN',@level2name=N'int'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of months to deduct. 0 means months to be determined upon release' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LoanClassAdvance', @level2type=N'COLUMN',@level2name=N'principal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Education code.. i.e. Elementary, High School, College, Others' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RefInfo', @level2type=N'COLUMN',@level2name=N'educ_code'
GO
USE [master]
GO
ALTER DATABASE [iFinance] SET  READ_WRITE 
GO
