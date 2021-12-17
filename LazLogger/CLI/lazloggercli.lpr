program LazLoggerCLI;

{$mode objfpc}{$H+}

uses
  LazLogger
;

var
  LOG_INFO,
  LOG_WARNING,
  LOG_ERROR,
  LOG_DEBUG: PLazLoggerLogGroup;

begin
  // Force a log file at runtime
  //DebugLogger.LogName:='lazloggercli.log';

  // Initializing Log Groups
  DebugLogger.ParamForEnabledLogGroups:= '--debug-enable';
  LOG_INFO:=DebugLogger.FindOrRegisterLogGroup('LOG_INFO', True);
  LOG_WARNING:=DebugLogger.FindOrRegisterLogGroup('LOG_WARNING', True);
  LOG_ERROR:=DebugLogger.FindOrRegisterLogGroup('LOG_ERROR', True);
  LOG_DEBUG:=DebugLogger.FindOrRegisterLogGroup('LOG_DEBUG', False);

  DebugLn('Starting');
  DebugLn('LogName: ', DebugLogger.LogName);
  DebugLn('ParamForEnabledLogGroups: ', DebugLogger.ParamForEnabledLogGroups);
  DebugLnEnter('Start doing some work');
  DebugLn(LOG_INFO, 'LOG_INFO: I''m happy doing work!');
  DebugLn(LOG_WARNING, 'LOG_WARNING: I''m happy doing work!');
  DebugLn(LOG_ERROR, 'LOG_ERROR: I''m happy doing work!');
  DebugLn(LOG_DEBUG, 'LOG_DEBUG: I''m happy doing work!');
  DebugLn('DEBUGLN: I''m happy doing work!');
  DbgOut('DBGOUT: I''m happy doing work!');
  DebugLnExit('Ending doing some work');
  DebugLn('Ending');
end.

