program ComplexMenu;

uses
  App, Objects, Drivers,
  Views, Menus, Dialogs;

const
  cmAbout = 1001;
  cmPara  = 1003;
  cmMenuEnglish  = 1005;
  cmMenuGerman   = 1006;
  cmMenuPorguese = 1007;


type
  TMyApp = object(TApplication)
    procedure InitStatusLine; virtual;
    procedure InitMenuBar;    virtual;
    procedure HandleEvent(var Event: TEvent); virtual;

  private
    menuGer, menuEng, menuPt: PMenuView;
    StatusGer, StatusEng, StatusPt: PStatusLine;
  end;


  procedure TMyApp.InitStatusLine;
  var
    Rect: TRect;
  begin
    GetExtent(Rect);
    Rect.A.Y := Rect.B.Y - 1;

    // status DE
    StatusGer := New(PStatusLine, Init(Rect,
      NewStatusDef(0, $FFFF,
        NewStatusKey('~Alt+X~ Program beenden', kbAltX, cmQuit,
          NewStatusKey('~F10~ Menue', kbF10, cmMenu,
            NewStatusKey('~F1~ Hilfe', kbF1, cmHelp, nil))), nil)));

    // status EN
    StatusEng := New(PStatusLine, Init(Rect,
      NewStatusDef(0, $FFFF,
        NewStatusKey('~Alt+X~ Exit', kbAltX, cmQuit,
          NewStatusKey('~F10~ Menu', kbF10, cmMenu,
            NewStatusKey('~F1~ Help', kbF1, cmHelp, nil))), nil)));

    // status PT
    StatusEng := New(PStatusLine, Init(Rect,
      NewStatusDef(0, $FFFF,
        NewStatusKey('~Alt+X~ Sair', kbAltX, cmQuit,
          NewStatusKey('~F10~ Menu', kbF10, cmMenu,
            NewStatusKey('~F1~ Ajuda', kbF1, cmHelp, nil))), nil)));


     StatusLine := StatusPt; // PT-BR que manda carai 
  end;


  procedure TMyApp.InitMenuBar;

  var
    Rect: TRect;

  begin
    GetExtent(Rect);
    Rect.B.Y := Rect.A.Y + 1;

    // DE
    menuGer := New(PMenuBar, Init(Rect, 
      NewMenu(
        NewSubmenu('~D~atei', hcNoContext,
          NewMenu(
            NewItem('S~c~hliessen', 'Alt-F3', kbAltF3, cmClose, hcNoContext,
              NewLine(
                NewItem('~B~eenden', 'Alt-X', kbAltX, cmQuit, hcNoContext, nil)))),
          NewSubMenu('~O~ptionen', hcNoContext,
            NewMenu(
              NewItem('~P~arameter...', '', kbF2, cmPara, hcNoContext,
                NewLine(
                  NewItem('~D~eutsch', 'Alt-D', kbAltD, cmMenuGerman, hcNoContext,
                    NewItem('~E~nglisch', 'Alt-E', kbAltE, cmMenuEnglish, hcNoContext, 
                      NewItem('~P~ortugiesisch', 'Alt-P', kbAltP, cmMenuPorguese, hcNoContext,
                        nil)))))),
            NewSubMenu('~H~ilfe', hcNoContext, 
              NewMenu(
                NewItem('~A~bout...', '', kbNoKey, cmAbout, hcNoContext, nil)), nil))))));

     // EN
    menuEng := New(PMenuBar, Init(Rect, 
      NewMenu(
        NewSubmenu('~F~ile', hcNoContext,
          NewMenu(
            NewItem('~C~lose', 'Alt-F3', kbAltF3, cmClose, hcNoContext,
              NewLine(
                NewItem('E~x~it', 'Alt-X', kbAltX, cmQuit, hcNoContext, nil)))),
          NewSubMenu('~O~ptions', hcNoContext,
            NewMenu(
              NewItem('~P~arameters...', '', kbF2, cmPara, hcNoContext,
                NewLine(
                  NewItem('German', 'Alt-D', kbAltD, cmMenuGerman, hcNoContext,
                    NewItem('Englisch', 'Alt-E', kbAltE, cmMenuEnglish, hcNoContext, 
                      NewItem('Portuguese', 'Alt-P', kbAltP, cmMenuPorguese, hcNoContext,
                        nil)))))),
            NewSubMenu('~H~elp', hcNoContext, 
              NewMenu(
                NewItem('~A~bout...', '', kbNoKey, cmAbout, hcNoContext, nil)), nil))))));

 
     // PT-BR
    menuPt := New(PMenuBar, Init(Rect, 
      NewMenu(
        NewSubmenu('~A~rquivo', hcNoContext,
          NewMenu(
            NewItem('~F~echar', 'Alt-F3', kbAltF3, cmClose, hcNoContext,
              NewLine(
                NewItem('~S~air', 'Alt-X', kbAltX, cmQuit, hcNoContext, nil)))),
          NewSubMenu('~O~pcoes', hcNoContext,
            NewMenu(
              NewItem('~P~ametros...', '', kbF2, cmPara, hcNoContext,
                NewLine(
                  NewItem('Alemao', 'Alt-D', kbAltD, cmMenuGerman, hcNoContext,
                    NewItem('Ingles', 'Alt-E', kbAltE, cmMenuEnglish, hcNoContext, 
                      NewItem('Portugues', 'Alt-P', kbAltP, cmMenuPorguese, hcNoContext,
                        nil)))))),
            NewSubMenu('A~j~uda', hcNoContext, 
              NewMenu(
                NewItem('So~b~re...', '', kbNoKey, cmAbout, hcNoContext, nil)), nil))))));

    MenuBar := menuPt;
  end;


  procedure TMyApp.HandleEvent(var Event: TEvent);
  var
    Rect: TRect;

  begin
    GetExtent(Rect);
    Rect.A.Y := Rect.B.Y - 1;
    inherited HandleEvent(Event);

    if Event.What = evCommand then begin
      case Event.Command of
        cmAbout: begin
          // about dialog
        end;

        cmMenuEnglish: begin
          Delete(MenuBar);
          MenuBar := menuEng;
          Insert(MenuBar);

          Delete(StatusLine);
          StatusLine := StatusEng;
          Insert(StatusLine);
        end;

        cmMenuGerman: begin
          Delete(MenuBar);
          MenuBar := menuGer;
          Insert(MenuBar);

          Delete(StatusLine);
          StatusLine := StatusGer;
          Insert(StatusLine);
        end;
 
        cmMenuPorguese: begin
          Delete(MenuBar);
          MenuBar := menuPt;
          Insert(MenuBar);

          Delete(StatusLine);
          StatusLine := StatusPt;
          Insert(StatusLine);
        end;                              

        cmPara: begin
          // parameter dialog
        end;

      else begin
        Exit;
      end;
    end;
  end;

  ClearEvent(Event);
end;

var MyApp: TMyApp;

begin
  MyApp.Init;
  MyApp.Run;
  MyApp.Done;
end.

