# For ... ;do ... ;done

## SSH multiple hosts

```
for NODE in hostname1 hostname2 hostname3 
;do 
    ssh -t $NODE "sudo apt update" 
;done
```

