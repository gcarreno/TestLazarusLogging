program LazLoggerGUI;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Common.Logging,

  {$IFDEF LOG}
  LazLogger,
  {$ELSE}
  LazLoggerDummy,
  {$ENDIF}

  Interfaces, // this includes the LCL widgetset
  Forms, Forms.Main
  { you can add units after this };

{$R *.res}


begin
  InitLogGroups;

  DebugLnEnter(LOG_INFO, ['[INFO ', {$I %FILE%},'(', {$I %LINENUM%}, ')] ', 'Starting']);
  RequireDerivedFormResource:=True;
  Application.Title:='Lazarus Logger GUI';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
  DebugLnExit(LOG_INFO, ['[INFO ', {$I %FILE%},'(', {$I %LINENUM%}, ')] ', 'Exiting']);
end.

