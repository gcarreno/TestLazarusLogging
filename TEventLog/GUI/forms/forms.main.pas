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
, StdCtrls
, ExtCtrls
, ActnList
, StdActns
, Menus
, eventlog
;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    aclMain: TActionList;
    actEventLogLog: TAction;
    actEventLogActiveToggle: TAction;
    actEventLogAppendContentToggle: TAction;
    btnEventLogLog: TButton;
    chbEventlogActive: TCheckBox;
    chbEventLogAppendContent: TCheckBox;
    cbbEventLogLogType: TComboBox;
    cbbEventLogDefaultEventType: TComboBox;
    edtEventLogFilename: TEdit;
    edtLogLine: TEdit;
    EventLog: TEventLog;
    actFileExit: TFileExit;
    lblLogProcedure: TLabel;
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
    sttEventLogDefaultEventType: TStaticText;
    sttEventLogLogType: TStaticText;
    sttEventLogFilename: TStaticText;
    sttLogLine: TStaticText;
    procedure aclMainUpdate(AAction: TBasicAction; var Handled: Boolean);
    procedure actEventLogActiveToggleExecute(Sender: TObject);
    procedure actEventLogAppendContentToggleExecute(Sender: TObject);
    procedure actEventLogLogExecute(Sender: TObject);
    procedure cbbEventLogDefaultEventTypeChange(Sender: TObject);
    procedure cbbEventLogLogTypeChange(Sender: TObject);
    procedure edtEventLogFilenameChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure InitShortCuts;
    procedure SetFormComponents;
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

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  InitShortCuts;
  SetFormComponents;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  //
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  CanClose:= True;
end;

procedure TfrmMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction:= caFree;
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

procedure TfrmMain.SetFormComponents;
begin
  cbbEventLogLogType.ItemIndex:= 1;
  cbbEventLogDefaultEventType.ItemIndex:= 0;
  sttEventLogFilename.Enabled:= False;
  edtEventLogFilename.Enabled:= False;
end;

procedure TfrmMain.aclMainUpdate(AAction: TBasicAction; var Handled: Boolean);
begin
  if AAction = actEventLogActiveToggle then
  begin
    panPropertiesProperties.Enabled:= EventLog.Active;
    panLog.Enabled:= EventLog.Active;
    Handled:= True;
  end;

  if AAction = actEventLogLog then
  begin
    actEventLogLog.Enabled:= edtLogLine.Text <> EmptyStr;
    Handled:= True;
  end;
end;

procedure TfrmMain.actEventLogActiveToggleExecute(Sender: TObject);
begin
  EventLog.Active:= chbEventlogActive.Checked;
end;

procedure TfrmMain.actEventLogAppendContentToggleExecute(Sender: TObject);
begin
  EventLog.AppendContent:= chbEventLogAppendContent.Checked;
end;

procedure TfrmMain.actEventLogLogExecute(Sender: TObject);
var
  log: String;
begin
  if Length(edtLogLine.Text) = 0 then
    exit;

  log:= Format('[%s(%d)] %s', [ {$I %FILE%}, {$I %LINENUM%},  edtLogLine.Text]);

  if rabLogLog.Checked then
  begin
    EventLog.Log(log);
  end;

  if rabLogInfo.Checked then
  begin
    EventLog.Info(log);
  end;

  if rabLogWarning.Checked then
  begin
    EventLog.Warning(log);
  end;

  if rabLogError.Checked then
  begin
    EventLog.Error(log);
  end;

  if rabLogDebug.Checked then
  begin
    EventLog.Debug(log);
  end;

end;

procedure TfrmMain.cbbEventLogDefaultEventTypeChange(Sender: TObject);
var
  combo: TComboBox;
begin
  combo:= Sender as TComboBox;
  case combo.ItemIndex of
    0:begin
      EventLog.DefaultEventType:= etCustom;
    end;
    1:begin
      EventLog.DefaultEventType:= etDebug;
    end;
    2:begin
      EventLog.DefaultEventType:= etError;
    end;
    3:begin
      EventLog.DefaultEventType:= etInfo;
    end;
    4:begin
      EventLog.DefaultEventType:= etWarning;
    end;
    otherwise
      // Do nothing
  end;
end;

procedure TfrmMain.cbbEventLogLogTypeChange(Sender: TObject);
var
  combo: TComboBox;
begin
  combo:= Sender as TComboBox;
  EventLog.Active:= False;
  try
    if combo.ItemIndex = 0 then
    begin
      sttEventLogFilename.Enabled:= True;
      edtEventLogFilename.Enabled:= True;
    end
    else
    begin
      sttEventLogFilename.Enabled:= False;
      edtEventLogFilename.Enabled:= False;
    end;

    case combo.ItemIndex of
      0:begin
        EventLog.LogType:= ltFile;
        if edtEventLogFilename.Text = EmptyStr then
        begin
          edtEventLogFilename.Text:= 'teventloggui.log';
        end;
      end;
      1:begin
        EventLog.LogType:= ltStdErr;
      end;
      2:begin
        EventLog.LogType:= ltStdOut;
      end;
      3:begin
        EventLog.LogType:= ltSystem;
      end;
      otherwise
        // Do Nothing
    end;
  finally
    EventLog.Active:= True;
  end;
end;

procedure TfrmMain.edtEventLogFilenameChange(Sender: TObject);
begin
  EventLog.Active:= False;
  try
    if edtEventLogFilename.Text <> EmptyStr then
    begin
      EventLog.FileName:= Format('%s/%s', [ ExtractFileDir(ParamStr(0)), edtEventLogFilename.Text ]);
    end;
  finally
    EventLog.Active:= True;
  end;
end;

end.

