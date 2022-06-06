program StatusMessage;

uses
  App, Objects, Drivers, 
  Views, Menus;

type
  TMyApp = object(TApplication)
    procedure InitStatusLine; virtual;
  end;


procedure TMyApp.InitStatusLine;
var
  Rect: TRect;
begin
  GetExtent(Rect);
  Rect.A.Y := Rect.B.Y - 1;

  StatusLine := New(
    PStatusLine, 
    Init(
      Rect,
      NewStatusDef(0, $FFFF, 
        NewStatusKey('~Alt+X~ End Program', kbAltX, cmQuit, nil), nil)));

end;

var 
  MyApp: TMyApp;

begin
  MyApp.Init;
  MyApp.Run;
  MyApp.Done;
end.
      
