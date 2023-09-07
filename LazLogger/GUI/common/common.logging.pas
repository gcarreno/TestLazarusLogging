unit Common.Logging;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF LOG}
  LazLogger
  {$ELSE}
  LazLoggerDummy
  {$ENDIF}
;

var
  LOG_INFO,
  LOG_WARNING,
  LOG_ERROR,
  LOG_DEBUG: PLazLoggerLogGroup;

procedure InitLogGroups;

implementation

procedure InitLogGroups;
begin
  // Initializing Log Groups
  {$IFDEF LOG}
  DebugLogger.ParamForEnabledLogGroups:= '--debug-groups-enable';
  {$ENDIF}
  LOG_INFO:=DebugLogger.FindOrRegisterLogGroup('LOG_INFO', True);
  LOG_WARNING:=DebugLogger.FindOrRegisterLogGroup('LOG_WARNING', True);
  LOG_ERROR:=DebugLogger.FindOrRegisterLogGroup('LOG_ERROR', True);
  LOG_DEBUG:=DebugLogger.FindOrRegisterLogGroup('LOG_DEBUG', False);
end;

end.

