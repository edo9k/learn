program HelloWorld;

uses
  App, MsgBox;

var
  MyApp: TApplication;

begin
  MyApp.Init;

  MessageBox('Hello, World!', nil, mfOkButton);

  MyApp.Done;
end.

