## Proxmox Helper
[Proxmox Helper Scripts](https://github.com/tteck/Proxmox)

---

## Folder Locations
Containers Conf ```/etc/pve/lxc/```

VM Conf ```/etc/pve/qemu-server/```

VZDump Backup ```/var/lib/vz/dump/```

ISO Folder ```/var/lib/vz/template/iso/```

Container Templates ```/var/lib/vz/template/cache/```

---

## Networking
> Configuration For Mode 4 Bonding
```
cp /etc/network/interfaces /etc/network/interfaces.bak
nano /etc/network/interfaces
```
```
#bonding
auto lo
iface lo inet loopback
iface enp35s0 inet manual
iface enp36s0 inet manual

auto bond0
iface bond0 inet manual
	bond-slaves enp35s0 enp36s0
	bond-miimon 100
#Bond Mode 4 – 802.3ad
	bond-mode 4

auto vmbr0
iface vmbr0 inet static
	address 192.168.1.11/24
 	gateway 192.168.1.1
	bridge-ports bond0
	bridge-stp off
	bridge-fd 0
```
Change host file
```
nano /etc/hosts
```

---

## Dark Theme
```
wget https://raw.githubusercontent.com/Weilbyte/PVEDiscordDark/master/PVEDiscordDark.py

python3 PVEDiscordDark.py
```

## Sources
https://github.com/Weilbyte/PVEDiscordDark

---

## Rename Node
### Modify Host
```systemctl stop pve*```

```nano /etc/hostname``` 
> pve

```nano /etc/hosts```
> 192.168.1.XX pve.local pve

```reboot```

### Move CT & VM Files
```
mv /etc/pve/nodes/<old_host_name>/lxc/* /etc/pve/nodes/<new_host_name>/lxc
mv /etc/pve/nodes/<old_host_name>/qemu-server/* /etc/pve/nodes/<new_host_name>/qemu-server
rm -r /etc/pve/nodes/<old_host_name>
```

### Separate A Node Without Reinstalling
```
pvecm status
systemctl stop pve-cluster
systemctl stop corosync
pmxcfs -l
rm /etc/pve/corosync.conf
killall pmxcfs
systemctl start pve-cluster
```

## VNC

Edit VM configuration file
```
vim /etc/pve/local/qemu-server/22.conf
```

Add argument to VM configuration file.
```
args: -vnc 0.0.0.0:22
```

VNC Settings:
```
Server: 192.168.1.91:5922
```
> * No other settings need to be added

## LVM

### Add disk to pve pool
Remove all partitions
```
sgdisk --zap-all /dev/sda
```
Create new partion
```
sgdisk -N 1 /dev/sda
```
Create physical volume
```
pvcreate /dev/sda1
```
Extend the pve volume group
```
vgextend pve /dev/sda1
```
Show available space
```
vgs
```
Extend the logical volume pve data 
```
lvextend /dev/pve/data -l +100%FREE
```

### Remove disk from pve pool
```
lvs -a -o +devices
pvdisplay
vgchange -an [VG Name]
vgremove [VG Name]
pvremove [PV Name]
```