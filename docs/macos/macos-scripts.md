# macOS Scripts

## TL defaults

`curl -L https://mac.technoluc.nl > .macos && chmod 755 .macos`

``` title=".macos"
--8<-- "docs/macos/.macos"
```

## Installomator

source: [Installomator/Installomator](https://github.com/Installomator/Installomator)

```bash
curl -OL https://github.com/Installomator/Installomator/raw/main/Installomator.sh && sudo zsh ./Installomator.sh microsoftofficebusinesspro DEBUG=0
```

## setup.sh 

source: [bradp/setup.sh](https://gist.github.com/bradp/bea76b16d3325f5c47d4)

`curl -LO https://technoluc.nl/macos/setup.sh`

``` title="setup.sh"
--8<-- "docs/macos/setup.sh"
```

## Rename Mac UserName And Home Directory

source [TheJumpCloud/support](https://github.com/TheJumpCloud/support/blob/master/scripts/macos/RenameMacUserNameAndHomeDirectory.sh)

``` title="RenameMacUserNameAndHomeDirectory.sh"
--8<-- "docs/macos/RenameMacUserNameAndHomeDirectory.sh"
```

## Defaults

source [pathikrit/mac-setup-script](https://github.com/pathikrit/mac-setup-script)

``` title="defaults.sh"
--8<-- "docs/macos/defaults.sh"
```

## Download and Install Microsoft products

source [talkingmoose/Download and Install Microsoft product.zsh](https://gist.github.com/talkingmoose/a16ca849416ce5ce89316bacd75fc91a)

``` title="MicrosoftInstallScript.sh"
--8<-- "docs/macos/MicrosoftInstallScript.sh"
```

## Install Office 365 script


```bash
/usr/bin/curl --location --silent "https://go.microsoft.com/fwlink/?linkid=2009112" -o "O365BusinessPro.pkg" && /usr/sbin/installer -pkg "O365BusinessPro.pkg" -target /
```

## Activate Office 365 script

``` title="MicrosoftActivate.md"
--8<-- "https://gist.github.com/zthxxx/9ddc171d00df98cbf8b4b0d8469ce90a/raw/61a60e3a9754fe0b36919bcf14d7ef12a0e386a9/Activate%2520Office%25202019%2520for%2520macOS%2520VoL.md"
```
