# Windows System File Checks – Complete Cheatsheet

Een uitgebreide, overzichtelijke gids met alle belangrijke **CHKDSK**, **SFC** en **DISM**-commando’s voor Windows. Handig voor onderhoud, foutoplossing en reparatie van systeembestanden.

---

## **1. CHKDSK (Check Disk)**

**CHKDSK** controleert de harde schijf op fouten en kan deze zo nodig repareren.

| **Commando**   | **Functie**                                                         |
| -------------- | ------------------------------------------------------------------- |
| `chkdsk c:`    | Voert een **read-only** scan uit. Geen reparaties, alleen controle. |
| `chkdsk /f c:` | Controleert en **repareert automatisch** gevonden fouten.           |
| `chkdsk /r c:` | Zoekt **fysieke slechte sectoren** en herstelt leesbare data.       |

**Tips:**

* Gebruik altijd **Command Prompt (Admin)**.
* Bij gebruik van `/f` of `/r` kan een **herstart** nodig zijn.

---

## **2. SFC (System File Checker)**

**SFC** controleert Windows-systeembestanden op corruptie en repareert ze indien mogelijk.

| **Commando**                                         | **Functie**                                                                                   |
| ---------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `sfc /scannow`                                       | Controleert **alle beschermde systeembestanden** en repareert corrupte bestanden automatisch. |
| `sfc /verifyonly`                                    | Controleert systeembestanden op fouten, **zonder reparatie**.                                 |
| `sfc /scanfile=C:\pad\bestand.dll`                   | Controleert **één specifiek bestand** en repareert het indien nodig.                          |
| `sfc /verifyfile=C:\pad\bestand.dll`                 | Controleert alleen een specifiek bestand, **zonder reparatie**.                               |
| `sfc /offbootdir=C:\ /offwindir=C:\Windows /scannow` | Voert een **offline SFC-scan** uit, bijvoorbeeld via Windows RE of installatiemedia.          |

**Let op:**

* Voer SFC altijd uit in **Administrator Command Prompt** of **PowerShell**.
* Resultaten worden gelogd in `C:\Windows\Logs\CBS\CBS.log`.

---

## **3. DISM (Deployment Image Servicing and Management)**

**DISM** repareert het Windows-image en wordt vooral gebruikt als SFC niet voldoende is.

### **3.1. Basiscontroles**

| **Commando**                                 | **Functie**                                                     |
| -------------------------------------------- | --------------------------------------------------------------- |
| `DISM /Online /Cleanup-Image /CheckHealth`   | Snelle controle of het Windows-image beschadigd is.             |
| `DISM /Online /Cleanup-Image /ScanHealth`    | Voert een **grondige scan** uit op beschadigingen.              |
| `DISM /Online /Cleanup-Image /RestoreHealth` | Repareert het Windows-image **automatisch** via Windows Update. |

---

### **3.2. Geavanceerde reparaties**

| **Commando**                                                                             | **Functie**                                                                                                         |
| ---------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `DISM /Online /Cleanup-Image /RestoreHealth /Source:D:\sources\install.wim`              | Repareert Windows met een **install.wim**-bestand van een installatie-ISO of USB.                                   |
| `DISM /Online /Cleanup-Image /RestoreHealth /Source:D:\sources\install.esd /LimitAccess` | Zelfde als hierboven, maar dan met een **install.esd**-bestand. `/LimitAccess` voorkomt gebruik van Windows Update. |
| `DISM /Online /Cleanup-Image /StartComponentCleanup`                                     | Opruimen van oude en ongebruikte systeembestanden na updates.                                                       |
| `DISM /Online /Cleanup-Image /AnalyzeComponentStore`                                     | Analyseert hoeveel ruimte kan worden bespaard in de **component store**.                                            |
| `DISM /Online /Cleanup-Image /RestoreHealth /LimitAccess`                                | Probeert reparaties **zonder Windows Update**, handig voor offline omgevingen.                                      |

**Let op:**

* Resultaten worden gelogd in `C:\Windows\Logs\DISM\dism.log`.
* Als Windows Update niet beschikbaar is, gebruik dan een **install.wim** of **install.esd** als bron.

---

## **4. Beste volgorde bij problemen**

Bij hardnekkige fouten is dit de aanbevolen volgorde:

```cmd
DISM /Online /Cleanup-Image /RestoreHealth
sfc /scannow
```

**Waarom deze volgorde?**

* **DISM** repareert eerst het **Windows-image** zelf.
* **SFC** gebruikt daarna het gerepareerde image om beschadigde systeembestanden te herstellen.

---

## **5. Logbestanden**

| **Tool** | **Locatie logbestand**          |
| -------- | ------------------------------- |
| SFC      | `C:\Windows\Logs\CBS\CBS.log`   |
| DISM     | `C:\Windows\Logs\DISM\dism.log` |

**Tip:**
Gebruik `notepad <pad>` om logbestanden direct te openen.

---

## **6. Praktische tips**

* Voer alle commando’s uit via **Administrator Command Prompt** of **PowerShell**.
* Mount een Windows-installatie-ISO als bron bij grote reparaties.
* Combineer DISM en SFC voor de beste resultaten.
* Herstart de pc na `/f`, `/r` of grote reparaties.

---

## **7. Snelle referentie**

```cmd
:: Controleer en repareer systeembestanden
sfc /scannow

:: Check Windows-image status
DISM /Online /Cleanup-Image /CheckHealth

:: Grondige scan op image-schade
DISM /Online /Cleanup-Image /ScanHealth

:: Repareer Windows-image via Windows Update
DISM /Online /Cleanup-Image /RestoreHealth

:: Repareer Windows-image met ISO-bron
DISM /Online /Cleanup-Image /RestoreHealth /Source:D:\sources\install.wim /LimitAccess

:: Schijfcontrole uitvoeren
chkdsk c:
chkdsk /f c:
chkdsk /r c:
```

---
