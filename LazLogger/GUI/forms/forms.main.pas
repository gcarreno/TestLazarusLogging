unit Forms.Main;

{$mode objfpc}{$H+}

interface

uses
  Classes
, SysUtils
, Forms
, Controls
, Graphics
, Dialogs
, StdCtrls, Menus, ActnList, StdActns
, Common.Logging
{$IFDEF LOG}
, LazLogger
{$ELSE}
, LazLoggerDummy
{$ENDIF}
;

type

{ TfrmMain }
  TfrmMain = class(TForm)
    aclMain: TActionList;
    btnLog: TButton;
    actFileExit: TFileExit;
    mamMain: TMainMenu;
    mnuFile: TMenuItem;
    mnuFileExit: TMenuItem;
    procedure btnLogClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
  private
    procedure InitShortCuts;
  public

  end;

var
  frmMain: TfrmMain;

implementation

uses
  LCLType
;

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.btnLogClick(Sender: TObject);
begin
  DebugLn(LOG_INFO, ['INFO: btnLogClick']);
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  DebugLn(LOG_INFO, ['INFO: FormCloseQuery']);
  CanClose:= True;
end;

procedure TfrmMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DebugLn(LOG_INFO, ['INFO: FormClose']);
  CloseAction:= caFree;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  InitShortCuts;
  DebugLn(LOG_INFO, ['INFO: FormCreate']);
end;

procedure TfrmMain.InitShortCuts;
begin
{$IFDEF LINUX}
  actFileExit.ShortCut := KeyToShortCut(VK_Q, [ssCtrl]);
{$ENDIF}
{$IFDEF WINDOWS}
  actFileExit.ShortCut := KeyToShortCut(VK_X, [ssAlt]);
{$ENDIF}
end;

end.

