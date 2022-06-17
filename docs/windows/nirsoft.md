# Download NirSoft software via terminal

1. Install wget
```bat
winget install gnuwin32.wget
```

2. Add wget to $PATH
```bat
$Env:PATH = "C:\Program Files (x86)\GnuWin32\bin;$Env:PATH"
```

3. Download software with referer 
```bat
wget  --referer foo 'https://www.nirsoft.net/toolsdownload/netpass-x64.zip' --output-document 'netpass-x64.zip' --no-check-certificate
```

4. Add 7-zip to $PATH
```bat
$Env:PATH = "C:\Program Files\7-Zip;$Env:PATH"
```

5. Extract zip with password
```bat
7z.exe e .\netpass-x64.zip -pntps5291#
```
