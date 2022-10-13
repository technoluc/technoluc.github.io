# Excel commands and formulas

## Extract last word from cell
```
=SPATIES.WISSEN(RECHTS(SUBSTITUEREN(B3;" ";HERHALING(" ";30));30))
```

## Extract last two words from cell
```
=DEEL(D3;VIND.ALLES("@";SUBSTITUEREN(D3;" ";"@";LENGTE(D3)-LENGTE(SUBSTITUEREN(D3;" ";""))-1))+1;100)
```

## Delete last word from cell
```
=LINKS(SPATIES.WISSEN(B3);VIND.ALLES("~";SUBSTITUEREN(B3;" ";"~";LENGTE(SPATIES.WISSEN(B3))-LENGTE(SUBSTITUEREN(SPATIES.WISSEN(B3);" ";""))))-1)
```
