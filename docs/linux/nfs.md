# NFS installation and fixes

### Install nfs-common
On Debian/Ubuntu

```
sudo apt-get install nfs-common 
```

## Fix nfs service

```
sudo rm /lib/systemd/system/nfs-common.service
```

## Switch user to root
```
sudo su
```

## Create nfs-common.service
```
cat >/etc/systemd/system/nfs-common.service <<\EOF
[Unit]
Description=NFS Common daemons
Wants=remote-fs-pre.target
DefaultDependencies=no

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/etc/init.d/nfs-common start
ExecStop=/etc/init.d/nfs-common stop

[Install]
WantedBy=sysinit.target
EOF
```

## Reload systemd, start and enable nfs service
```
sudo systemctl daemon-reload && sudo systemctl enable nfs-common && sudo systemctl start nfs-common && sudo systemctl status nfs-common
```

## Add nfs server to `/etc/fstab` to mount automatically at boot

For example mount folder "folder" from server 192.168.2.10 on mount point /home/username/nfsmount 

```
mkdir nfsmount && echo -e '\n192.168.2.10:/share/folder /home/technoluc/nfsmount/ nfs defaults 0 0' | sudo tee -a /etc/fstab
```