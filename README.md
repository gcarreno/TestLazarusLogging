# TestLazarusLogging

Repository to test and learn how to use the many logging choices in Lazarus

## List of options

- LazLogger: https://wiki.freepascal.org/LazLogger
- TEventLogger: https://wiki.lazarus.freepascal.org/TEventLog
- MultiLog: https://wiki.freepascal.org/MultiLog (OPM)
- ExceptionLogger: https://github.com/r3code/lazarus-exception-logger (OPM)
- Log4Delphi: https://wiki.freepascal.org/Log4Delphi
- QucikLogger: https://github.com/exilon/QuickLogger

## LazLogger

pros:
- Part of the FCL
- Command line params
- User defined log groups

cons:
- Does not have multiple log providers

For more information on this option: [LazLogger README](LazLogger/README.md)

## TEventLog

pros:
- Part of the LCL
- Windows: Uses the system log

cons:
- Does not have multiple log providers

todo:
- Linux: Need to see if there is some difference geared towards a Linux system log

For more information on this option: [TEventLog README](TEventLog/README.md)
