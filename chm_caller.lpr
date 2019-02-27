{$apptype gui}
program chm_caller;

uses
  Windows, SysUtils, ATChmHelp;
const
  cInf =
    'CHM_Caller (c) UVviewsoft.com'#13#13+
    'Usage:'#13+
    'CHM_Caller.exe "<CHM file name>" "<Help topic string>"'#13;

const
  caption = 'CHM_Caller';
var
  fn: string;
  h: HWND;

{$R *.res}

begin
  if ParamCount<2 then
  begin
    MessageBox(0, cInf, caption, mb_ok or mb_iconinformation);
    Exit;
  end;

  fn:= ParamStr(1);
  if not FileExists(fn) then
  begin
    MessageBox(0, PChar('CHM file not found:'#13+fn), caption, mb_ok or mb_iconerror);
    Exit;
  end;

  h:= DoViewHtmlHelp(0, fn, ParamStr(2));
  while IsWindow(h) do
    Sleep(1000);
end.
