# Troubleshooting

## Windows 10

### Small Start menu icon

run the following in (admin) powershell and reboot the pc:
```bat
Get-appxpackage -all *shellexperience* -packagetype bundle |% {add-appxpackage -register -disabledevelopmentmode ($_.installlocation + “\appxmetadata\appxbundlemanifest.xml”)}
```
