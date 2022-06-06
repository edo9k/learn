program RadioButton;

uses
  App,    Objects,  Drivers,
  Views,  Menus,    Dialogs;

const
  cmAbout = 1001;
  cmList  = 1002;
  cmPara  = 1003;

type
  TMyApp = object(TApplication)
    procedure InitStatusLine; virtual;
    procedure InitMenuBar; virtual;
    procedure HandleEvent(var Event: TEvent); virtual;
    procedure MyParameter;
  end;

procedure TMyApp.InitStatusLine;
var
  Rect: TRect;
  P0: PStatusDef;
  P1, P2, P3 : PStatusItem;

begin
  GetExtent(Rect);
  Rect.A.Y := Rect.B.Y - 1;

  P3 := NewStatusKey('~F1~ Ajuda',   kbF1,   cmHelp, nil);
  P2 := NewStatusKey('~F10~ Menu',   kbF10,  cmMenu, P3);
  P1 := NewStatusKey('~Alt+X~ Sair', kbAltX, cmQuit, P2);
  P0 := NewStatusDef(0, $FFFF, P1, nil);

  StatusLine := New(PStatusLine, Init(Rect, P0));
end;


procedure TMyApp.InitMenuBar;
var
  Rect: TRect;

  M: PMenu;
  SM0, SM1, SM2,
  M0_0, M0_2, M0_3, M0_4, M0_5,
  M1_0, M2_0: PMenuItem;

begin
  GetExtent(Rect);
  Rect.B.Y := Rect.A.Y + 1;

  M2_0 := NewItem('~S~obre...', '', kbNoKey, cmAbout, hcNoContext,nil);
  SM2 := NewSubMenu('~A~juda', hcNoContext, NewMenu(M2_0), nil);

  M1_0 := NewItem('~P~arametros...', '', kbF2, cmPara, hcNoContext, nil);
  SM1 := NewSubMenu('~O~pcoes', hcNoContext, NewMenu(M1_0), SM2);

  M0_5 := NewItem('Sai~r~', 'Alt-R', kbAltR, cmQuit, hcNoContext, nil);
  M0_4 := NewLine(M0_5);
  M0_3 := NewItem('~F~echar', 'Alt-F3', kbAltF3, cmClose, hcNoContext, M0_4);
  M0_2 := NewLine(M0_3);
  M0_0 := NewItem('~L~istar', 'F2', kbF2, cmList, hcNoContext, M0_2);
  SM0  := NewSubMenu('~D~ados', hcNoContext, NewMenu(M0_0), SM1);

  M := NewMenu(SM0);

  MenuBar := New(PMenuBar, Init(Rect, M));
end;


procedure TMyApp.HandleEvent(var Event: TEvent);
begin
  inherited HandleEvent(Event);

  if Event.What = evCommand then begin
    case Event.Command of
      cmAbout: begin
      end;
      cmList: begin
      end;
      cmPara: begin
        MyParameter;
      end;
      else begin
        Exit;
      end;
    end;
  end;

  ClearEvent(Event);
end;


procedure TMyApp.MyParameter;
var
  Dia: PDialog;
  Rect: TRect;
  dummy: word;
  Ptr: PView;

begin
  Rect.Assign(0, 0, 35, 15);
  Rect.Move(23, 3);
  Dia := New(PDialog, Init(Rect, 'Parameter'));
  with Dia^ do begin
    
    // checkbutton
    Rect.Assign(2, 3, 18, 7);
    Ptr := New(PCheckBoxes, Init(Rect,
      NewSItem('~D~anone',
        NewSItem('~Z~umbi',
          NewSItem('~S~ei nao',
            NewSItem('~Z~umba',
            nil))))));
    Insert(Ptr);

    // radiobutton
    Rect.Assign(21, 3, 33, 6);
    Ptr := New(PRadioButtons, Init(Rect,
      NewSItem('~G~rande',
        NewSItem('~M~edio',
          NewSItem('~P~equeno',
            nil)))));
    Insert(Ptr);

    // ok button
    Rect.Assign(7, 12, 17, 14);
    Insert(new(PButton, Init(Rect, '~A~hhrrgh', cmCancel, bfNormal)));

    // botão de fechar
    Rect.Assign(19, 12, 32, 14);
    Insert(new(PButton, Init(Rect, '~F~echar', cmCancel, bfNormal)));
  end;

  dummy := Desktop^.ExecView(Dia);
  Dispose(Dia, Done);
end;

var 
  MyApp: TMyApp;

begin
  MyApp.Init;
  MyApp.Run;
  MyApp.Done;
end.

