unit LoanAlerts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, Vcl.StdCtrls, RzEdit,
  RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, RzButton;

type
  TfrmLoanAlerts = class(TfrmBasePopup)
    mmAlerts: TRzMemo;
    btnOk: TRzButton;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLoanAlerts: TfrmLoanAlerts;

implementation

{$R *.dfm}

uses
  Loan;

end.
