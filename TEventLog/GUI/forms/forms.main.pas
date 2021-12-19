unit Forms.Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, eventlog, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, ActnList, StdActns, Menus;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    aclMain: TActionList;
    actEventLogLog: TAction;
    actEventLogActiveToggle: TAction;
    btnEventLogLog: TButton;
    chbEventlogActive: TCheckBox;
    chbAppendContent: TCheckBox;
    edtLogLine: TEdit;
    EventLog: TEventLog;
    actFileExit: TFileExit;
    lblLogProcedure: TLabel;
    lblLogLine: TLabel;
    mamMain: TMainMenu;
    mnuFile: TMenuItem;
    mnuFileExit: TMenuItem;
    panPropertiesProperties: TPanel;
    panLogTitle: TPanel;
    panLogButtons: TPanel;
    panLogRadio: TPanel;
    panProperties: TPanel;
    panLog: TPanel;
    panPropertiesTitle: TPanel;
    rabLogLog: TRadioButton;
    rabLogInfo: TRadioButton;
    rabLogWarning: TRadioButton;
    rabLogError: TRadioButton;
    rablogDebug: TRadioButton;
    procedure aclMainUpdate(AAction: TBasicAction; var Handled: Boolean);
    procedure actEventLogActiveToggleExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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

procedure TfrmMain.InitShortCuts;
begin
{$IFDEF LINUX}
  actFileExit.ShortCut := KeyToShortCut(VK_Q, [ssCtrl]);
{$ENDIF}
{$IFDEF WINDOWS}
  actFileExit.ShortCut := KeyToShortCut(VK_X, [ssAlt]);
{$ENDIF}
end;

procedure TfrmMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction:= caFree;
end;

procedure TfrmMain.aclMainUpdate(AAction: TBasicAction; var Handled: Boolean);
begin
  if AAction = actEventLogLog then
  begin
    panPropertiesProperties.Enabled:= not EventLog.Active;
    panLog.Enabled:= EventLog.Active;
    Handled:= True;
  end;
end;

procedure TfrmMain.actEventLogActiveToggleExecute(Sender: TObject);
begin
  EventLog.Active:= chbEventlogActive.Checked;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  CanClose:= True;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  InitShortCuts;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  //
end;

end.

