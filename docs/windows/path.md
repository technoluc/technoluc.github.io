# Add path to $PATH 

```bat
$ENV:PATH
```

The first way is simply to do:

```bat
$ENV:PATH="$ENV:PATH;c:\path\to\folder"
```

But this change isn’t permenant, <code class="language-powershell"><span class="token variable">$env</span>:path</code> will default back to what it was before as soon as you close your powershell terminal and reopen it again. That’s because you have applied the change at the session level and not at the source level (which is the registry level). To view the global value of <code class="language-powershell"><span class="token variable">$env</span>:path</code>, do:

```bat
Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH 
```
or, more specifically:

```bat
(Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path
```
Now to change this, first we capture the original path that needs to be modified:

```bat
$oldpath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path
```
Now we define what the new path should look like, in this case we are appending a new folder:
```bat
$newpath = “$oldpath;c:\path\to\folder”
```

Note: Be sure that the $newpath looks how you want it to look, if not then you could damage your OS.

Now apply the new value:
```bat
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value $newPath
```
Now do one final check that it looks how you expect it:

```bat
Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).Path
```
You can now restart your powershell terminal (or even reboot machine) and see that it doesn’t rollback to it’s old value again. Note the ordering of the paths may change so that it’s in alphabetical order, so make sure you check the whole line, to make it easier, you can split the output into rows by using the semi-colon as a delimeter:

```bat
($env:path).split(";")
```
