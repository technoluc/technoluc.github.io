# Download NirSoft software via terminal

0. Install 7Zip (run in powershell)
```bat 
Invoke-RestMethod https://raw.githubusercontent.com/technoluc/technoluc.github.io/main/docs/windows/install_7zip.ps1 | Invoke-Expression
```

1. Add 7-zip to $PATH
```bat
$Env:PATH = "C:\Program Files\7-Zip;$Env:PATH"
```

2. Install wget
```bat
irm -uri "https://eternallybored.org/misc/wget/releases/wget-1.21.4-win64.zip" -outfile wget.zip
7z.exe e .\wget.zip -oc:\Windows\System32
```

wget alternative
``` bat
winget install gnuwin32.wget
# Add wget to $PATH
$Env:PATH = "C:\Program Files (x86)\GnuWin32\bin;$Env:PATH"
```

3. Remove Alias
```bat
Remove-Item alias:wget
```

### Nirsoft Netpass
```bat
# Download software with referer
wget  --referer foo 'https://www.nirsoft.net/toolsdownload/netpass-x64.zip' --output-document 'netpass-x64.zip' --no-check-certificate
# Extract zip with password to folder NetPass (x: keeps folders, e: extracts all files)
7z.exe x .\netpass-x64.zip -pntps5291# -oNetPass
```

### NirLauncher
```bat
# Download software with referer
wget --referer foo 'https://download.nirsoft.net/nirsoft_package_enc_1.30.6.zip' --output-document 'nirsoft_package_enc_1.30.6.zip' --no-check-certificate
# Extract zip with password to folder NirLauncher (x: keeps folders, e: extracts all files)
7z.exe x .\nirsoft_package_enc_1.30.6.zip -pnirsoft9876$ -oNirLauncher
```
