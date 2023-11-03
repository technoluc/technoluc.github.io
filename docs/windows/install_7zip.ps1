function Install-7ZipIfNeeded {
    $7ZipInstalled = Test-Path "C:\Program Files\7-Zip\7z.exe"
  
    if (-not $7ZipInstalled) {
        Write-Host "7-Zip is not installed. Installing..."
        $InstallerUrl = "https://www.7-zip.org/a/7z2301-x64.exe"
        $InstallerPath = Join-Path -Path $env:TEMP -ChildPath "7zInstaller.exe"
        
        # Download the 7-Zip installer
        Invoke-WebRequest -Uri $InstallerUrl -OutFile $InstallerPath -UseBasicParsing
        
        # Install 7-Zip with /S for silent installation
        Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait
        
        # Check for successful installation
        $7ZipInstalled = Test-Path "C:\Program Files\7-Zip\7z.exe"
        if ($7ZipInstalled) {
            Write-Host "7-Zip has been successfully installed."
        } else {
            Write-Host "Error: 7-Zip installation failed."
        }
  
        # Remove the temporary installation file
        Remove-Item -Path $InstallerPath -Force
    } else {
    }
  }

  Install-7ZipIfNeeded
