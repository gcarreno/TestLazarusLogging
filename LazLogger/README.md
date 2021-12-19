# LazLogger

In this folder we test and learn about `LazLogger`

## Command line options

`LazLogger` enabled applications respond to two command line options:

- `--debug-log=file` - File to log to instead of `STDOUT`
- A runtime defined one to enable/disable log groups(comma sepearted list), example `--debug-enable`

The first one is rather simple to explain: If you use it to define a file you want to dump the log into, it wioll do so and not output to `STDOUT`

The second one is not defined in code, but is dependent on you turning it on by setting the `ParamForEnabledLogGroups` property of the globally defined `DebugLogger`.

Example:

```pascal
begin
  DebugLogger.ParamForEnabledLogGroups:= '--debug-enable';
end;
```

This is used due to the fact that you can register groups enbled by default or not:  

```pascal
var
  LOG_INFO,
  LOG_WARNING,
  LOG_ERROR,
  LOG_DEBUG: PLazLoggerLogGroup;

begin
  LOG_INFO:=DebugLogger.FindOrRegisterLogGroup('LOG_INFO', True); // Enabled by default
  LOG_WARNING:=DebugLogger.FindOrRegisterLogGroup('LOG_WARNING', True); // Enabled by default
  LOG_ERROR:=DebugLogger.FindOrRegisterLogGroup('LOG_ERROR', True); // Enabled by default
  LOG_DEBUG:=DebugLogger.FindOrRegisterLogGroup('LOG_DEBUG', False); // NOT enabled by default
end;
```

In order to enable `LOG_DEBUG` and disable `LOG_INFO`(Prepend a dash/minus):

```console
$ ./project1 --debug-enable=-LOG_INFO,LOG_DEBUG
```

> **NOTE**: There's a bug that has been reported that the first element of the comma separated list is ignored.
> Until issue is resolved use `--debug-enable=,-LOG_INFO,LOG_DEBUG`
