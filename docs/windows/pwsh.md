# PowerShell

## Clear History in PowerShell

Get the PowerShell command history file location:

```bat
(Get-PSReadlineOption).HistorySavePath
```

Show the contents of the PowerShell command history file:

```bat
cat (Get-PSReadlineOption).HistorySavePath
```

Clear the command history in PowerShell by deleting the history file:

```bat
Remove-Item (Get-PSReadlineOption).HistorySavePath
```

Change how PowerShell command history is saved:

default:

```bat
Set-PSReadlineOption -HistorySaveStyle SaveIncrementally
```

```bat
Set-PSReadlineOption -HistorySaveStyle SaveAtExit
```

```bat
Set-PSReadlineOption -HistorySaveStyle SaveNothing
```