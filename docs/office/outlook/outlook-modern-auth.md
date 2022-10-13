# Enable Modern authentication for Office 2013 on Windows devices

| Registry key                                                                  |    Type   | Value |
|-------------------------------------------------------------------------------|:---------:|:-----:|
| HKEY_CURRENT_USER\Software\Microsoft\Exchange\AlwaysUseMSOAuthForAutoDiscover | REG_DWORD |   1   |
| HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Common\Identity\EnableADAL   | REG_DWORD |   1   |
| HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Common\Identity\Version      | REG_DWORD |   1   |

## Enable modern authentication for Office 2013 clients

Enable modern authentication for Office 2013 clients

1. Close Outlook.

2. Copy and paste the following text into Notepad:

```text
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\Microsoft\Exchange]
"AlwaysUseMSOAuthForAutoDiscover"=dword:00000001

[HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Common]

[HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Common\Identity]
"EnableADAL"=dword:00000001
"Version"=dword:00000001
```

3. Save the file with the file extension .reg instead of .txt in a location that's easy for you to find. For example, C:\Data\Office2013_Enable_ModernAuth.reg.

4. Open File Explorer (formerly known as Windows Explorer), browse to the location of the .reg file you just saved, and then double-click it.

5. In the User account control dialog that appears, click Yes to allow the app to make changes to your device.

6. In the Registry Editor warning dialog that appears, click Yes to accept the changes.

Once you've set the registry keys, you can set Office 2013 apps to use multifactor authentication (MFA) with Microsoft 365. For more information, see Set up multifactor authentication.

If you're currently signed in to any of Office client apps, you need to sign out and sign back in for the change to take effect. Otherwise, the MRU and roaming settings will be unavailable until the identity is established.

source [Microsoft](https://learn.microsoft.com/en-us/microsoft-365/admin/security-and-compliance/enable-modern-authentication?view=o365-worldwide)
