# macOS Scripts

## Installomator

source: [Installomator/Installomator](https://github.com/Installomator/Installomator)

```bash
curl -OL https://github.com/Installomator/Installomator/raw/main/Installomator.sh && sudo ./Installomator.sh microsoftofficebusinesspro DEBUG=0
```

## setup.sh 

source: [bradp/setup.sh](https://gist.github.com/bradp/bea76b16d3325f5c47d4)

``` title=“setup.sh”

--8<-- “docs/macos/setup.sh”
```

## RenameMacUserNameAndHomeDirectory

source [TheJumpCloud/support](https://github.com/TheJumpCloud/support/blob/master/scripts/macos/RenameMacUserNameAndHomeDirectory.sh)

``` title=“RenameMacUserNameAndHomeDirectory.sh”

--8<-- “docs/macos/RenameMacUserNameAndHomeDirectory.sh”
```

## Defaults

source [pathikrit/mac-setup-script](https://github.com/pathikrit/mac-setup-script)

``` title=“defaults.sh”

--8<-- “docs/macos/defaults.sh”
```

## Download and Install Microsoft products

source [talkingmoose/Download and Install Microsoft product.zsh](https://gist.github.com/talkingmoose/a16ca849416ce5ce89316bacd75fc91a)

``` title=“MicrosoftInstallScript.sh”

--8<-- “docs/macos/MicrosoftInstallScript.sh”
```

## Install Office 365 script


```bash
/usr/bin/curl --location --silent "https://go.microsoft.com/fwlink/?linkid=2009112" -o "O365BusinessPro.pkg" && /usr/sbin/installer -pkg "O365BusinessPro.pkg" -target /
```

## TL defaults

``` title=“defaults_luc.sh”

--8<-- “docs/macos/defaults_luc.sh”
```
