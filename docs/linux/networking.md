# Edit network configurations

## Change IP Address in Ubuntu 20.04 LTS

1. Create a new file `/etc/netplan/01-netcfg.yaml`

```
network:
  version: 2
  renderer: networkd
  ethernets:
    ens3:
      dhcp4: no
      addresses:
        - 192.168.121.221/24
      gateway4: 192.168.121.1
      nameservers:
          addresses: [8.8.8.8, 1.1.1.1]
```
2. Apply changes

```
netplay apply
```

## Renew DHCP lease
```
sudo dhclient -r ens18 && sudo dhclient ens18
```