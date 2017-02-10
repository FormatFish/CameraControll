unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

const WM_CAP_START = WM_USER;
const WM_CAP_STOP = WM_CAP_START + 68;
const WM_CAP_DRIVER_CONNECT = WM_CAP_START + 10;
const WM_CAP_DRIVER_DISCONNECT = WM_CAP_START + 11;
const WM_CAP_SAVEDIB = WM_CAP_START + 25;
const WM_CAP_GRAB_FRAME = WM_CAP_START + 60;
const WM_CAP_SEQUENCE = WM_CAP_START + 62;
const WM_CAP_FILE_SET_CAPTURE_FILEA = WM_CAP_START + 20;
const WM_CAP_SEQUENCE_NOFILE =WM_CAP_START+ 63;
const WM_CAP_SET_OVERLAY =WM_CAP_START+ 51;
const WM_CAP_SET_PREVIEW =WM_CAP_START+ 50 ;
const WM_CAP_SET_CALLBACK_VIDEOSTREAM = WM_CAP_START +6;
const WM_CAP_SET_CALLBACK_ERROR=WM_CAP_START +2;
const WM_CAP_SET_CALLBACK_STATUSA= WM_CAP_START +3;
const WM_CAP_SET_CALLBACK_FRAME= WM_CAP_START +5;
const WM_CAP_SET_SCALE=WM_CAP_START+ 53;
const WM_CAP_SET_PREVIEWRATE=WM_CAP_START+ 52;
 
function capCreateCaptureWindowA(lpszWindowName : PCHAR; dwStyle : longint; x : integer;

y : integer;nWidth : integer;nHeight : integer;ParentWin : HWND;

nId : integer): HWND;STDCALL EXTERNAL 'AVICAP32.DLL';

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
var
  hWndC : THandle;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
 hWndC := capCreateCaptureWindowA('My Own Capture Window',WS_CHILD or WS_VISIBLE ,Panel1.Left,Panel1.Top,Panel1.Width,Panel1.Height,Form1.Handle,0);

 hWndC := capCreateCaptureWindowA('My Own Capture Window',WS_CHILD or WS_VISIBLE ,Panel1.Left,Panel1.Top,Panel1.Width,Panel1.Height,Form1.Handle,0);

if hWndC <> 0 then
 
begin
    SendMessage(hWndC, WM_CAP_SET_CALLBACK_VIDEOSTREAM, 0, 0);
    SendMessage(hWndC, WM_CAP_SET_CALLBACK_ERROR, 0, 0);
    SendMessage(hWndC, WM_CAP_SET_CALLBACK_STATUSA, 0, 0);
    SendMessage(hWndC, WM_CAP_DRIVER_CONNECT, 0, 0);
    SendMessage(hWndC, WM_CAP_SET_SCALE, 1, 0);
    SendMessage(hWndC, WM_CAP_SET_PREVIEWRATE, 66, 0);
    SendMessage(hWndC, WM_CAP_SET_OVERLAY, 1, 0);
    SendMessage(hWndC, WM_CAP_SET_PREVIEW, 1, 0);
end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if hWndC <> 0 then
begin
SendMessage(hWndC, WM_CAP_DRIVER_DISCONNECT, 0, 0);
hWndC := 0;
end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
if hWndC <> 0 then
begin
SendMessage(hWndC,WM_CAP_SAVEDIB,0,longint(pchar('c:\\test.bmp')));
end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
if hWndC <> 0 then
begin
    SendMessage(hWndC,WM_CAP_FILE_SET_CAPTURE_FILEA,0, Longint(pchar('c:\\test.avi')));
    SendMessage(hWndC, WM_CAP_SEQUENCE, 0, 0);
end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
if hWndC <> 0 then
begin
SendMessage(hWndC, WM_CAP_STOP, 0, 0);
end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
close;
end;

end.
