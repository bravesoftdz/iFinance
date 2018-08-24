unit DevParams;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, RzButton, RzTabs,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel,
  Vcl.Mask, RzEdit, DateUtils, RzRadChk;

type
  TfrmDevParams = class(TfrmBasePopupDetail)
    dteApplicationDate: TRzDateTimeEdit;
    urlNextMonth: TRzURLLabel;
    cbxUpdateDeficits: TRzCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure urlNextMonthClick(Sender: TObject);
  private
    { Private declarations }
    FStartDate: TDateTime;
  protected
    procedure Save; override;
    procedure Cancel; override;
    procedure BindToObject; override;
    function ValidEntry: boolean; override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  IFinanceGlobal, Posting, DBUtil;

{ TfrmBasePopupDetail1 }

procedure TfrmDevParams.BindToObject;
begin
  inherited;

end;

procedure TfrmDevParams.Cancel;
begin
  inherited;

end;

procedure TfrmDevParams.FormCreate(Sender: TObject);
begin
  inherited;
  // initialise controls
  dteApplicationDate.Date := ifn.AppDate;
  FStartDate := ifn.AppDate;
end;

procedure TfrmDevParams.Save;
var
  LPosting: TPosting;
  LDate, LNewDate: TDateTime;
begin
  // NOTE !!! THIS METHOD IS COPIED AND PASTED IN THE LOAN CLASS DURING BACKLOG ENTRY
  ifn.AppDate := dteApplicationDate.Date;
  LPosting := TPosting.Create;
  try
    LDate := IncDay(FStartDate);
    LNewDate := ifn.AppDate;

    while LDate <= LNewDate do
    begin
      LPosting.PostPrincipal(LDate);
      LPosting.PostInterest2(LDate);

      if cbxUpdateDeficits.Checked then UpdateLoanDeficit(LDate);

      LDate := IncDay(LDate);
    end;
  finally
    LPosting.Free;
  end;
end;

procedure TfrmDevParams.urlNextMonthClick(Sender: TObject);
begin
  inherited;
  dteApplicationDate.Date := IncMonth(dteApplicationDate.Date);
end;

function TfrmDevParams.ValidEntry: boolean;
begin
  Result := true;
end;

end.
