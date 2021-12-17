program LazLoggerCLI;

{$mode objfpc}{$H+}

uses
  LazLogger
;

var
  LOG_INFO: PLazLoggerLogGroup;

begin
  // Set a log file at runtime
  //DebugLogger.LogName:='lazloggercli.log';

  // Initializing Log Group
  LOG_INFO:=DebugLogger.FindOrRegisterLogGroup('LOG_INFO', False);

  DebugLn('Starting');
  DebugLnEnter('Start doing some work');
  DebugLn(LOG_INFO, 'INFO: I''m happy doing work!');
  DebugLn('I''m happy doing work!');
  DebugLnExit('Ending doing some work');
  DebugLn('Ending');
end.

