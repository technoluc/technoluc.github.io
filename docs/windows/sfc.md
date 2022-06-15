# Windows FileSystemCheck

## 1. Run CHKDSK

Read-Only mode

```bat
chkdsk c:
```

To fix problems scanned by CHKDSK automatically

```bat
chkdsk /f c:
```

To scan errors and bad sectors, type

```bat
chkdsk /r c:
```

## 2. SFC to repair problems on Windows 10

SFC or System File Checker scans for all the system files in Windows, including protected files to see if they are corrupted are not. If SFC finds any corrupted system files in Windows, it will replace those damaged files using a cached copy. 

```bat
SFC /scannow
```

## 3. DISM to repair image of Windows 10

DISM stands for Deployment Image Servicing and Management. It is the most advanced scan in Windows, and we recommend using it only if CHKDSK and SFC do not work for you. DISM is a command-line tool that services Windows images and key parts of Windows recovery and setup.


The CheckHealth option with the DISM tool allows you to determine any corruptions inside the local Windows 10 image. Does not perform any repairs!

```bat
DISM /Online /Cleanup-Image /CheckHealth
```

The ScanHealth option does a more advanced scan to find out whether the image has any problems.

```bat
DISM /Online /Cleanup-Image /ScanHealth
```

If there are problems with the system image, use DISM with the RestoreHealth option to automatically scan and repair common issues.

```bat
DISM /Online /Cleanup-Image /RestoreHealth
```

