# TEventLog

In this folder we test and learn about `TEventLog`

## Properties

I'm documenting some of the total properties.

I'm ommiting 

### `Active`

According to many other `LCL` components this will activate the logger.

### `AppendContent`

This will append to an existing log file with the same name.

### `FileName`

If `TEventLog.LogType = ltFile`, this will be the name of the file where it logs to.

### `LogType`

This sets the target output for logging:

- `ltFile`: Logs to a file
- `ltStdErr`: Logs to Standard Error
- `ltStdOut`: Logs to Standard Output
- `lsSystem`: Logs to the system's logging service
