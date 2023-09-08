# TestLazarusLogging

Repository to test and learn how to use the many logging choices in Lazarus

## List of options

Tested:
- LazLogger: https://wiki.freepascal.org/LazLogger (Comes with Lazarus)
- TEventLogger: https://wiki.lazarus.freepascal.org/TEventLog (Comes with `fcl-base` package)

Work in Progress:
- MultiLog: https://wiki.freepascal.org/MultiLog  (OPM)
  - GitHub: https://github.com/blikblum/multilog

Next:
- QuickLogger: https://github.com/exilon/QuickLogger
  - Depends on QuickLib: fThreadLog

Maybe:
- ExceptionLogger: https://github.com/r3code/lazarus-exception-logger (OPM)
- Log4Delphi: https://wiki.freepascal.org/Log4Delphi
  - Author: http://log4delphi.sourceforge.net/index.html
  - Port for `FPC`: http://sourceforge.net/projects/lazarus-ccr/files/Log4Delphi
- Log4L: https://github.com/CynicRus/Log4L
- Renegade Logger: https://github.com/hiraethbbs/Renegade.Logger
- ooLog: https://github.com/VencejoSoftware/ooLog
- datalogger: https://github.com/dliocode/datalogger

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
