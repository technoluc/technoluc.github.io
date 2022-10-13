# Extract addresses by street, postal code and city

## Trim spaces

```
=SPATIES.WISSEN(B45)
```
## Extract last word to city
```
=SPATIES.WISSEN(RECHTS(SUBSTITUEREN(B3;" ";HERHALING(" ";30));30))
```
## Remove last word
```
=LINKS(SPATIES.WISSEN(C3);VIND.ALLES("~";SUBSTITUEREN(C3;" ";"~";LENGTE(SPATIES.WISSEN(C3))-LENGTE(SUBSTITUEREN(SPATIES.WISSEN(C3);" ";""))))-1)
```
## Extract last two words to postcode
```
=DEEL(D3;VIND.ALLES("@";SUBSTITUEREN(D3;" ";"@";LENGTE(D3)-LENGTE(SUBSTITUEREN(D3;" ";""))-1))+1;100)
```
## Remove last two words
```
=LINKS(SPATIES.WISSEN(D3);VIND.ALLES("~";SUBSTITUEREN(D3;" ";"~";LENGTE(SPATIES.WISSEN(D3))-LENGTE(SUBSTITUEREN(SPATIES.WISSEN(D3);" ";""))))-6)
```
