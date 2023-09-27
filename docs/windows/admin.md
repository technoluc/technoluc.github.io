# Reset a Forgotten Windows Administrator Password

1. Create a bootable Windows 10 disk on a flash drive
2. Boot from your flash drive, let the Windows installer load, and when you see the initial Windows Setup screen, press Shift + F10 to open a Command Prompt.
3. Next, you need to know which partition your Windows installation is on. Usually, this will be the C: drive, but it might be different for you. To check, type the following command, which will change the current directory of the Command Prompt to the root of the C: drive (or whichever letter you insert).
```powershell
cd /d C:
```
4. If the command returns The system cannot find the drive specified, then that letter isn't right; try D and continue down the alphabet. Once you find the right drive, you'll want to change the directory again using the cd command. Type this line to access the System32 folder:
```powershell
cd Windows\System32
```
5. Windows includes an accessibility feature called Sticky Keys, which you can launch by hitting the Shift key five times quickly. By swapping the executable that runs Sticky Keys with a link to the Command Prompt's executable file, you can run a command line to reset your password right from the login screen. To do this, type these two commands, one at a time. The first backs up the Sticky Keys shortcut in the C:\Windows folder (the .. is a shortcut to move to the parent folder) so you can restore it later; the second replaces the Sticky Keys shortcut with a Command Prompt shortcut. If asked to give approval for either, do so.
```powershell
copy sethc.exe ..
```
```powershell
copy cmd.exe sethc.exe
```
6. You're done here, so type this command to reboot the computer and head back to the normal sign-in screen:
```powershell
wpeutil reboot
```
7. If you're on an old version of Windows 10, or still using Windows 8 or earlier, you can press Shift five times on the login screen to open a Command Prompt. On modern versions of Windows 10 or Windows 11, you'll have to reboot into Safe Mode for this to work. To do this, click the Power menu in the bottom-right corner of the login screen. Then, hold the Shift key and click Restart. If you see a warning that restarting may cause people to lose work, click Restart Anyway.
8. Click Troubleshoot > Advanced Options > Startup Settings, then Restart. Your PC will reboot, then ask which startup option you want to use. Hit the 4 key to select Enable Safe Mode. This loads Windows with only the essential drivers and services, preventing Microsoft Defender from blocking the workaround.
9. When you reboot to the Windows sign-in screen in Safe Mode, hit Shift five times quickly. This should bring up a Command Prompt, which has administrator access. If this doesn't bring up the Command Prompt, repeat the steps in the above section, but use utilman.exe instead of sethc.exe as the file you rename.
10. Then, reboot into Safe Mode and click the Ease of Access icon at the bottom-right of the login screen, which should hopefully bring up the Command Prompt. On Windows 10, this icon looks like the clock icon in the bottom-right of the image below. On Windows 11, it looks like an outline of a person.
11. Now you can reset your account password, create a new account, or perform similar actions. To reset your account password, first type net user to see all accounts on your machine. Then, you can change the password for an account using the following command. Replace username and password with the actual username of your account and the new password you want to set, per the example after the template:
```powershell
net user username password
net user John newpass123
```
If you want to create a new user, whether as a backup or because your main account isn't working properly, enter the following. Again, swap username and password for the new user's name and new password, like in the example:
```powershell
net user username password /add
net user Rick greatpass123 /add
```
Then, run this command to make the new user an admin:
```powershell
net localgroup Administrators username /add
net localgroup Administrators Rick /add
```
Now, you've changed your account password and can log back in using it. Since you don't want to work in Safe Mode, reboot your computer and sign back in again as normal.
12. Putting Sticky Keys Back to Normal: Load into your computer with the account you've regained access to. Then, search the Start menu for cmd and click Run as administrator when it appears in the results. Provide admin permission to open an elevated Command Prompt. Then use this command to put the Sticky Keys shortcut back. If you used the utilman.exe method, run the same command with that instead of sethc.exe:
```powershell
Robocopy C:\Windows C:\Windows\System32 sethc.exe /B
```
```powershell
Robocopy C:\Windows C:\Windows\System32 Utilman.exe /B
```






