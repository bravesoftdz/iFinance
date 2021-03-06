unit Main;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Winapi.Windows, Winapi.Messages,
  Vcl.StdCtrls, DirectShow9, DXSUtil, DSPack, Vcl.ExtCtrls, AdvPanel, dxGDIPlusClasses;

type
  TfrmMain = class(TForm)
    shMain: TShape;
    pnlMain: TPanel;
    VideoSourceFilter: TFilter;
    CaptureGraph: TFilterGraph;
    SampleGrabber: TSampleGrabber;
    VideoWindow: TVideoWindow;
    lbImageDevice: TLabel;
    pnlTitle: TAdvPanel;
    lblTitle: TLabel;
    imgClose: TImage;
    ListBox: TListBox;
    ListBox2: TListBox;
    imgSnapshot: TImage;
    lblStatus: TLabel;
    Shape1: TShape;
    pnlCapture: TPanel;
    pnlClose: TPanel;
    shCapture: TShape;
    shClose: TShape;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlTitleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlCaptureClick(Sender: TObject);
    procedure pnlCloseClick(Sender: TObject);
    procedure imgCloseClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure SetImageDevice;
    procedure StartCapture;
    procedure GetSnapShot;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  VideoDevice: TSysDevEnum;
  VideoMediaTypes: TEnumMediaType;

implementation

{$R *.dfm}

procedure TfrmMain.GetSnapShot;
var
  path: string;
  filename: string;
begin
  path := '';

  SampleGrabber.GetBitmap(imgSnapShot.Picture.Bitmap);

  path := ParamStr(1);
  filename := ParamStr(2) + '.bmp';

  //save file
  if not DirectoryExists(path) then
    CreateDir(path);

  imgSnapShot.Picture.SaveToFile(path + filename);

  self.Close;
end;

procedure TfrmMain.imgCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.pnlCaptureClick(Sender: TObject);
begin
  GetSnapshot;
end;

procedure TfrmMain.pnlCloseClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmMain.pnlTitleMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
  if Button = mbLeft then
  begin
    ReleaseCapture;
    Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  i: integer;
begin
 VideoDevice := TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);
 for i := 0 to VideoDevice.CountFilters - 1 do
   ListBox.Items.Add(VideoDevice.Filters[i].FriendlyName);

 VideoMediaTypes := TEnumMediaType.Create;
end;

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
  // escape key
  if Key = #27 then  ModalResult := mrClose;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  ListBox.ItemIndex := 0;
  SetImageDevice;
end;

procedure TfrmMain.SetImageDevice;
var
 PinList: TPinList;
 i: integer;
begin
  if ListBox.Items.Count = 0 then
  begin
    lblStatus.Visible := true;
    exit;
  end;

  VideoDevice.SelectGUIDCategory(CLSID_VideoInputDeviceCategory);
  if ListBox.ItemIndex <> -1 then
  begin
    // Set the device which we work with
    VideoSourceFilter.BaseFilter.Moniker := VideoDevice.GetMoniker(ListBox.ItemIndex);
    VideoSourceFilter.FilterGraph := CaptureGraph;
    CaptureGraph.Active := true;
    PinList := TPinList.Create(VideoSourceFilter as IBaseFilter);
    ListBox2.Clear;
    VideoMediaTypes.Assign(PinList.First);

    // Adding permission to ListBox2, which supports device
    for i := 0 to VideoMediaTypes.Count - 1 do
      ListBox2.Items.Add(VideoMediaTypes.MediaDescription[i]);

    CaptureGraph.Active := false;
    PinList.Free;

    ListBox2.ItemIndex := 0;

    StartCapture;
  end;
end;

procedure TfrmMain.StartCapture;
var
 PinList: TPinList;
begin
  // Activating graph filter, at this stage the source filter is added to the graph
  CaptureGraph.Active := true;

  // The configuration of the output device
  if VideoSourceFilter.FilterGraph <> nil then
  begin
    PinList := TPinList.Create(VideoSourceFilter as IBaseFilter);
    if ListBox2.ItemIndex <> -1 then
      with (PinList.First as IAMStreamConfig) do
        SetFormat(VideoMediaTypes.Items[ListBox2.ItemIndex].AMMediaType^);
    PinList.Free;
  end;

  // now render streams
  with CaptureGraph as IcaptureGraphBuilder2 do
  begin
    // Hooking up a preview video (VideoWindow)
    if VideoSourceFilter.BaseFilter.DataLength > 0 then
      RenderStream(@PIN_CATEGORY_PREVIEW, nil, VideoSourceFilter as IBaseFilter,
        SampleGrabber as IBaseFilter , VideoWindow as IBaseFilter);
   end;

 //Launch video
 CaptureGraph.Play;
end;

end.
