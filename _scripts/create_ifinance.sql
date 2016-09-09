USE [master]
GO
/****** Object:  Database [iFinance]    Script Date: 10/09/2016 12:47:10 AM ******/
CREATE DATABASE [iFinance]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FMS', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.DEVELOPMENT\MSSQL\DATA\FMS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FMS_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.DEVELOPMENT\MSSQL\DATA\FMS_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [iFinance] SET AUTO_CREATE_STATISTICS ON 
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
ALTER DATABASE [iFinance] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [iFinance] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [iFinance]
GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_acct_info]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cl_get_acct_info]
	@entity_id char(9)
AS
BEGIN
	select *
	  from AcctInfo (nolock)
	 where entity_id = @entity_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_address_info_pres]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cl_get_address_info_pres]
	@entity_id char(9)
AS
BEGIN
	select *
	  from AddressInfo (nolock)
	 where entity_id = @entity_id
	   and isnull(is_prov,0) = 0
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_address_info_prov]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_cl_get_address_info_prov]
	@entity_id char(9)
AS
BEGIN
	select *
	  from AddressInfo (nolock)
	 where entity_id = @entity_id
	   and isnull(is_prov,0) = 1
END


GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_contact_info]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cl_get_contact_info]
	@entity_id char(9)
AS
BEGIN
	select *
	  from ContactInfo (nolock)
	 where entity_id = @entity_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_empl_info]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cl_get_empl_info]
	@entity_id char(9)
AS
BEGIN
	select *
	  from EmplInfo (nolock)
	 where entity_id = @entity_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_entity]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cl_get_entity]
	@entity_id char(9)
AS
BEGIN
	select *
	  from Entity (nolock)
	 where entity_id = @entity_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_ident_info]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cl_get_ident_info]
	@entity_id char(9)
AS
BEGIN
	select *
	  from IdentityInfo (nolock)
	 where entity_id = @entity_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cl_get_personal_info]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cl_get_personal_info]
	@entity_id char(9)
AS
BEGIN
	select *
	  from PersonalInfo (nolock)
	 where entity_id = @entity_id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_banks]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_banks]
AS
BEGIN
	select bank_id,
	       (bank_name + ' - ' + branch) bank_name,
		   branch
	  from Bank (nolock) b
	  join T_Bank (nolock) t
	    on t.bank_code = b.bank_code
END

GO
/****** Object:  StoredProcedure [dbo].[sp_dd_get_civil_status]    Script Date: 10/09/2016 12:47:10 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_dd_get_employment_status]    Script Date: 10/09/2016 12:47:10 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_dd_get_gender]    Script Date: 10/09/2016 12:47:10 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_dd_get_residence_status]    Script Date: 10/09/2016 12:47:10 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_dd_get_towns]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_dd_get_towns]
AS
BEGIN
	select post_code,
	       town
	  from T_Town (nolock)
  order by town 
END

GO
/****** Object:  StoredProcedure [dbo].[sp_gen_id]    Script Date: 10/09/2016 12:47:10 AM ******/
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
		if @seq_object = 'ENT'
		begin
			insert into Sequence values ('ENT',10001)
			set @id = 10001
		end
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
/****** Object:  StoredProcedure [dbo].[sp_get_entities]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_get_entities]
AS
BEGIN
	select P.entity_id,
	       (P.lastname + ', ' + P.firstname + ' ' + substring(isnull(P.middlename,''),1,1)) name,
		   P.lastname,
		   P.firstname,
		   P.middlename,
		   C.mobile_no,
		   C.home_phone
	  from Entity E (nolock)
	  join T_EntityType T (nolock)
	    on T.entity_type = E.entity_type
	  join PersonalInfo P (nolock)
	    on P.entity_id = E.entity_id
 left join ContactInfo C (nolock)
        on C.entity_id = E.entity_id
     where isnull(T.is_person,0) = 1
	   and isnull(T.is_active,0) = 1
  order by name
END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_get_empl_no]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_get_empl_no] 
(
	@entity_id char(9)
)
RETURNS int
AS
BEGIN
    declare @empl_no int

	select @empl_no = max(empl_no)
	  from EmplInfo (nolock)
	 where entity_id = @entity_id

	return isnull(@empl_no,0) + 1

END

GO
/****** Object:  Table [dbo].[AcctInfo]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AcctInfo](
	[acct_no] [varchar](15) NOT NULL,
	[entity_id] [char](9) NULL,
	[bank_id] [int] NULL,
	[card_no] [varchar](15) NULL,
 CONSTRAINT [PK_AcctInfo] PRIMARY KEY CLUSTERED 
(
	[acct_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AddressInfo]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AddressInfo](
	[entity_id] [char](9) NOT NULL,
	[st] [varchar](50) NULL,
	[brgy] [varchar](50) NULL,
	[post_code] [smallint] NULL,
	[res_status] [char](1) NULL,
	[landlord] [char](9) NULL,
	[is_prov] [smallint] NOT NULL,
 CONSTRAINT [PK_AddressInfo] PRIMARY KEY CLUSTERED 
(
	[entity_id] ASC,
	[is_prov] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bank](
	[bank_id] [int] NOT NULL,
	[bank_code] [varchar](5) NOT NULL,
	[branch] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED 
(
	[bank_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContactInfo]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactInfo](
	[entity_id] [char](9) NOT NULL,
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
/****** Object:  Table [dbo].[EmplInfo]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmplInfo](
	[entity_id] [char](9) NOT NULL,
	[empl_no] [smallint] NOT NULL,
	[employer] [varchar](50) NULL,
	[emp_address] [varchar](50) NULL,
	[emp_status] [char](3) NULL,
	[is_gov] [smallint] NOT NULL,
	[date_from] [date] NULL,
	[date_until] [date] NULL,
	[gross_pay] [decimal](8, 2) NULL,
	[serv_len] [smallint] NULL,
	[imm_head] [char](9) NULL,
	[net_pay] [decimal](8, 2) NULL,
	[des_id] [int] NULL,
 CONSTRAINT [PK_EmpInfo] PRIMARY KEY CLUSTERED 
(
	[entity_id] ASC,
	[empl_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Entity]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Entity](
	[entity_id] [char](9) NOT NULL,
	[entity_type] [char](2) NOT NULL,
	[ref_entity_id] [char](10) NULL,
 CONSTRAINT [PK_Entity] PRIMARY KEY CLUSTERED 
(
	[entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EntityLoanType]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EntityLoanType](
	[entity_id] [char](9) NOT NULL,
	[loan_type] [char](2) NOT NULL,
 CONSTRAINT [PK_EntityLoanType] PRIMARY KEY CLUSTERED 
(
	[entity_id] ASC,
	[loan_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpenseInfo]    Script Date: 10/09/2016 12:47:10 AM ******/
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
/****** Object:  Table [dbo].[IdentityInfo]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IdentityInfo](
	[entity_id] [char](9) NOT NULL,
	[ident_type] [char](2) NOT NULL,
	[ident_no] [varchar](50) NOT NULL,
 CONSTRAINT [PK_IdentityInfo] PRIMARY KEY CLUSTERED 
(
	[entity_id] ASC,
	[ident_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Loan]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Loan](
	[loan_id] [char](13) NOT NULL,
	[amt_appl] [decimal](10, 2) NOT NULL,
	[des_term] [smallint] NOT NULL,
	[purpose] [varchar](20) NOT NULL,
	[entity_id] [char](9) NOT NULL,
	[amt_appv] [decimal](10, 2) NULL,
	[date_appl] [date] NOT NULL,
	[loan_type] [char](2) NOT NULL,
	[int] [float] NOT NULL,
	[terms] [smallint] NOT NULL,
	[date_appv] [date] NULL,
	[date_rel] [date] NULL,
	[rel_branch] [char](3) NULL,
	[orig_branch] [char](3) NOT NULL,
 CONSTRAINT [PK_Loan] PRIMARY KEY CLUSTERED 
(
	[loan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PersonalInfo]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PersonalInfo](
	[entity_id] [char](9) NOT NULL,
	[lastname] [varchar](50) NOT NULL,
	[firstname] [varchar](50) NOT NULL,
	[middlename] [varchar](50) NULL,
	[birth_date] [date] NULL,
	[gender] [char](1) NULL,
	[civil_status] [char](1) NULL,
	[photo] [varchar](25) NULL,
 CONSTRAINT [PK_PersonalInfo] PRIMARY KEY CLUSTERED 
(
	[entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RefInfo]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RefInfo](
	[entity_id] [char](9) NOT NULL,
	[ref_entity_id] [char](9) NOT NULL,
	[ref_type] [char](3) NOT NULL,
 CONSTRAINT [PK_RefInfo] PRIMARY KEY CLUSTERED 
(
	[entity_id] ASC,
	[ref_entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sequence]    Script Date: 10/09/2016 12:47:10 AM ******/
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
/****** Object:  Table [dbo].[T_Bank]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Bank](
	[bank_code] [varchar](5) NOT NULL,
	[bank_name] [varchar](30) NOT NULL,
 CONSTRAINT [PK_T_Bank_1] PRIMARY KEY CLUSTERED 
(
	[bank_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Designation]    Script Date: 10/09/2016 12:47:10 AM ******/
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
/****** Object:  Table [dbo].[T_EntityType]    Script Date: 10/09/2016 12:47:10 AM ******/
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
	[is_active] [smallint] NOT NULL,
	[is_client] [smallint] NOT NULL,
	[is_person] [smallint] NOT NULL,
 CONSTRAINT [PK_T_Entity] PRIMARY KEY CLUSTERED 
(
	[entity_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ExpenseType]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ExpenseType](
	[expense_type] [char](3) NOT NULL,
	[expense_name] [varchar](25) NOT NULL,
	[expense_desc] [varchar](100) NULL,
 CONSTRAINT [PK_T_Expense] PRIMARY KEY CLUSTERED 
(
	[expense_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_IdentityType]    Script Date: 10/09/2016 12:47:10 AM ******/
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
 CONSTRAINT [PK_T_IdentityType] PRIMARY KEY CLUSTERED 
(
	[ident_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_LoanType]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_LoanType](
	[loan_type] [char](2) NOT NULL,
	[loan_name] [varchar](25) NULL,
	[int] [float] NULL,
	[max_term] [smallint] NULL,
	[is_active] [smallint] NULL,
 CONSTRAINT [PK_T_LoanType] PRIMARY KEY CLUSTERED 
(
	[loan_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ReferenceType]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ReferenceType](
	[ref_type] [char](3) NOT NULL,
	[ref_name] [varchar](25) NOT NULL,
	[ref_desc] [varchar](100) NULL,
 CONSTRAINT [PK_T_Reference] PRIMARY KEY CLUSTERED 
(
	[ref_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Town]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Town](
	[post_code] [smallint] NOT NULL,
	[town] [varchar](25) NULL,
 CONSTRAINT [PK_T_Town] PRIMARY KEY CLUSTERED 
(
	[post_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Term]    Script Date: 10/09/2016 12:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Term](
	[term_id] [int] NOT NULL,
	[loan_type] [char](2) NOT NULL,
	[int] [float] NOT NULL,
	[period] [smallint] NOT NULL,
	[loc_code] [char](3) NOT NULL,
 CONSTRAINT [PK_Term] PRIMARY KEY CLUSTERED 
(
	[term_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[AddressInfo] ADD  CONSTRAINT [DF_AddressInfo_is_prov]  DEFAULT ((0)) FOR [is_prov]
GO
ALTER TABLE [dbo].[EmplInfo] ADD  CONSTRAINT [DF_EmplInfo_empl_no]  DEFAULT ((0)) FOR [empl_no]
GO
ALTER TABLE [dbo].[EmplInfo] ADD  CONSTRAINT [DF_EmpInfo_is_private]  DEFAULT ((1)) FOR [is_gov]
GO
ALTER TABLE [dbo].[Entity] ADD  CONSTRAINT [DF_Entity_entity_type]  DEFAULT ('CL') FOR [entity_type]
GO
ALTER TABLE [dbo].[T_EntityType] ADD  CONSTRAINT [DF_T_Entity_is_valid]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[T_EntityType] ADD  CONSTRAINT [DF_T_EntityType_is_client]  DEFAULT ((1)) FOR [is_client]
GO
ALTER TABLE [dbo].[T_EntityType] ADD  CONSTRAINT [DF_T_EntityType_is_individual]  DEFAULT ((1)) FOR [is_person]
GO
ALTER TABLE [dbo].[T_LoanType] ADD  CONSTRAINT [DF_T_LoanType_is_active]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[AcctInfo]  WITH CHECK ADD  CONSTRAINT [FK_AcctInfo_Bank] FOREIGN KEY([bank_id])
REFERENCES [dbo].[Bank] ([bank_id])
GO
ALTER TABLE [dbo].[AcctInfo] CHECK CONSTRAINT [FK_AcctInfo_Bank]
GO
ALTER TABLE [dbo].[AcctInfo]  WITH CHECK ADD  CONSTRAINT [FK_AcctInfo_Entity] FOREIGN KEY([entity_id])
REFERENCES [dbo].[Entity] ([entity_id])
GO
ALTER TABLE [dbo].[AcctInfo] CHECK CONSTRAINT [FK_AcctInfo_Entity]
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
ALTER TABLE [dbo].[ContactInfo]  WITH CHECK ADD  CONSTRAINT [FK_ContactInfo_Entity] FOREIGN KEY([entity_id])
REFERENCES [dbo].[Entity] ([entity_id])
GO
ALTER TABLE [dbo].[ContactInfo] CHECK CONSTRAINT [FK_ContactInfo_Entity]
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
ALTER TABLE [dbo].[EntityLoanType]  WITH CHECK ADD  CONSTRAINT [FK_EntityLoanType_Entity] FOREIGN KEY([entity_id])
REFERENCES [dbo].[Entity] ([entity_id])
GO
ALTER TABLE [dbo].[EntityLoanType] CHECK CONSTRAINT [FK_EntityLoanType_Entity]
GO
ALTER TABLE [dbo].[EntityLoanType]  WITH CHECK ADD  CONSTRAINT [FK_EntityLoanType_T_LoanType] FOREIGN KEY([loan_type])
REFERENCES [dbo].[T_LoanType] ([loan_type])
GO
ALTER TABLE [dbo].[EntityLoanType] CHECK CONSTRAINT [FK_EntityLoanType_T_LoanType]
GO
ALTER TABLE [dbo].[ExpenseInfo]  WITH CHECK ADD  CONSTRAINT [FK_ExpenseInfo_Loan] FOREIGN KEY([loan_id])
REFERENCES [dbo].[Loan] ([loan_id])
GO
ALTER TABLE [dbo].[ExpenseInfo] CHECK CONSTRAINT [FK_ExpenseInfo_Loan]
GO
ALTER TABLE [dbo].[ExpenseInfo]  WITH CHECK ADD  CONSTRAINT [FK_ExpenseInfo_T_ExpenseType] FOREIGN KEY([expense_type])
REFERENCES [dbo].[T_ExpenseType] ([expense_type])
GO
ALTER TABLE [dbo].[ExpenseInfo] CHECK CONSTRAINT [FK_ExpenseInfo_T_ExpenseType]
GO
ALTER TABLE [dbo].[IdentityInfo]  WITH CHECK ADD  CONSTRAINT [FK_IdentityInfo_Entity] FOREIGN KEY([entity_id])
REFERENCES [dbo].[Entity] ([entity_id])
GO
ALTER TABLE [dbo].[IdentityInfo] CHECK CONSTRAINT [FK_IdentityInfo_Entity]
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK_Loan_Entity] FOREIGN KEY([entity_id])
REFERENCES [dbo].[Entity] ([entity_id])
GO
ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK_Loan_Entity]
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK_Loan_T_LoanType] FOREIGN KEY([loan_type])
REFERENCES [dbo].[T_LoanType] ([loan_type])
GO
ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK_Loan_T_LoanType]
GO
ALTER TABLE [dbo].[PersonalInfo]  WITH CHECK ADD  CONSTRAINT [FK_PersonalInfo_Client] FOREIGN KEY([entity_id])
REFERENCES [dbo].[Entity] ([entity_id])
GO
ALTER TABLE [dbo].[PersonalInfo] CHECK CONSTRAINT [FK_PersonalInfo_Client]
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
ALTER TABLE [dbo].[Term]  WITH CHECK ADD  CONSTRAINT [FK_Term_T_LoanType] FOREIGN KEY([loan_type])
REFERENCES [dbo].[T_LoanType] ([loan_type])
GO
ALTER TABLE [dbo].[Term] CHECK CONSTRAINT [FK_Term_T_LoanType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Residence status' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AddressInfo', @level2type=N'COLUMN',@level2name=N'res_status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Landlord of the rented property. Value is from the entity_id field of the Entity table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AddressInfo', @level2type=N'COLUMN',@level2name=N'landlord'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Immediate head. Value is the entity_id field from the Entity table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmplInfo', @level2type=N'COLUMN',@level2name=N'imm_head'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Driver''s license.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IdentityInfo', @level2type=N'COLUMN',@level2name=N'ident_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Amount applied.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'amt_appl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Desired term.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'des_term'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date approved.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'date_appv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date released.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'date_rel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Releasing branch. Loans can be released in another branch.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'rel_branch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Branch of origin. Where the application originated.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'orig_branch'
GO
USE [master]
GO
ALTER DATABASE [iFinance] SET  READ_WRITE 
GO
