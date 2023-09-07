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
  DebugLogger.ParamForEnabledLogGroups:= '--debug-groups-enable';
  LOG_INFO:=DebugLogger.FindOrRegisterLogGroup('LOG_INFO', True);
  LOG_WARNING:=DebugLogger.FindOrRegisterLogGroup('LOG_WARNING', True);
  LOG_ERROR:=DebugLogger.FindOrRegisterLogGroup('LOG_ERROR', True);
  LOG_DEBUG:=DebugLogger.FindOrRegisterLogGroup('LOG_DEBUG', False);

  DebugLn(['[INFO ', {$I %FILE%},'(', {$I %LINENUM%}, ')] ', 'Starting']);
  //DebugLn('LogName: ', DebugLogger.LogName);
  DebugLn(LOG_INFO, ['[INFO ', {$I %FILE%},'(', {$I %LINENUM%}, ')] ', 'Starting']);
  DebugLn(LOG_INFO, ['[INFO ', {$I %FILE%},'(', {$I %LINENUM%}, ')] ', 'ParamForEnabledLogGroups: ', DebugLogger.ParamForEnabledLogGroups]);
  DebugLnEnter(LOG_INFO, ['[INFO ', {$I %FILE%},'(', {$I %LINENUM%}, ')] ', 'DEBUGLNENTER: Start doing some work']);
  DebugLn(LOG_INFO, ['[INFO ', {$I %FILE%},'(', {$I %LINENUM%}, ')] ', 'LOG_INFO: I''m happy doing work!']);
  DebugLn(LOG_WARNING, ['[WARNING ', {$I %FILE%},'(', {$I %LINENUM%}, ')] ', 'LOG_WARNING: I''m happy doing work!']);
  DebugLn(LOG_ERROR, ['[ERROR ', {$I %FILE%},'(', {$I %LINENUM%}, ')] ', 'LOG_ERROR: I''m happy doing work!']);
  DebugLn(LOG_DEBUG, ['[DEBUG ', {$I %FILE%},'(', {$I %LINENUM%}, ')] ', 'LOG_DEBUG: I''m happy doing work!']);
  DebugLn(['[INFO ', {$I %FILE%},'(', {$I %LINENUM%}, ')] ', 'DEBUGLN: I''m happy doing work!']);
  DbgOut(['[INFO ', {$I %FILE%},'(', {$I %LINENUM%}, ')] ', 'DEBUGOUT: I''m happy doing work!']);
  DebugLnExit(['[INFO ', {$I %FILE%},'(', {$I %LINENUM%}, ')] ', 'Ending doing some work']);
  DebugLn(['[INFO ', {$I %FILE%},'(', {$I %LINENUM%}, ')] ', 'Ending']);
end.

