# Useful Commands 

## Update all

```bash
sudo apt-get update && sudo apt-get upgrade -y
```

## πShell scripts

<aside>
π‘ One example of an easy script

</aside>

```bash
cd /usr/local/bin
sudo nano updateupgrade
sudo chmod a+x updateupgrade
updateupgrade

```

```bash
#!/bin/bash

sudo apt-get update && sudo apt-get upgrade
```

---

## πCommand Chaining

### (;) The Semicolon Operator

<aside>
π‘ A ; B  β Run A and then B, regardless of the success or failure of A

</aside>

### (&&) The Logical AND Operator

<aside>
π‘ A && B  β Run B only if A succeeded

</aside>

### (||) The Logical OR Operator

<aside>
π‘ A || B  β Run B only if A failed

</aside>

---

## Echo/Tee

### Append text to file with echo/tee

```bash

echo 'text' | sudo tee -a /path/to/file

```

## Append content of file to file

```bash

cat my_file.txt | sudo tee -a existing_file.txt > /dev/null

```

**Examples :**

<aside>
π‘ echo <b>-e </b> : for option \n

</aside>

<aside>
π‘ <b>\n</b>  : creates new line from where it is used.

</aside>

```bash
 echo -e "Geeks \nfor \nGeeks"
```

```bash

echo '\n${QNAP_IP}:/${QNAP_PATH} ${LOCAL_PATH} nfs defaults 0 0 ' | sudo tee -a /etc/fstab

```


---

## Sed


<b> Replace text in file </b>

<aside>
π‘ (change ssl=1 to ssl=0 in file /etc/webmin/miniserv.conf

</aside>

```bash
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf

```

---

## wget/curl

### wget

<aside>
π‘ Download file to current directory

</aside>

```bash
wget "http://domain.com/directory/4?action=AttachFile&do=view&target=file.tgz"
```

<aside>
π‘ download file to /home/${USER}/Desktop/

</aside>

```bash
wget  -P /home/${USER}/Desktop/ "http://thecanadiantestbox.x10.mx/CC.zip"

```

<aside>
π‘ download file as /home/${USER}/Desktop/NewFileName

</aside>

```bash
wget  -O /home/${USER}/Desktop/NewFileName "http://thecanadiantestbox.x10.mx/CC.zip"

```

---

### curl

<aside>
π‘ Download file to current directory

</aside>

```bash
curl βO [URL]
```

<aside>
π‘ Download file as filename

</aside>

```bash
curl βo [filename] [URL]
```

---

## dpkg

<b> Install .deb Package Using Dpkg </b>

```bash
sudo dpkg --install [.deb file]
```

<aside>
π‘ This command will fix the broken package and install the required dependencies assuming they are available in the system repository.

</aside>

```bash
sudo apt -f install
```

<b> Remove Installed Package Using Dpkg </b>

<aside>
π‘ To find out the exact package name, you can use the following command with any keyword related to the package name:

</aside>

```bash
dpkg βl | grep keyword
```

```bash
sudo dpkg --remove [package file]
```

## chmod

<aside>
π‘ The `chmod` command [sets the file permissions flags](https://www.howtogeek.com/67987/htg-explains-how-do-linux-file-permissions-work/) on a file or folder. The flags define who can read, write to or execute the file. When you list files with the `-l` (long format) option youβll see a string of characters that look like

</aside>

```
-rwxrwxrwx
```

If the first character is a `-` the item is a file, if it is a `d` the item is a directory. The rest of the string is three sets of three characters. From the left, the first three represent the file permissions of the *owner*, the middle three represent the file permissions of the *group* and the rightmost three characters represent the permissions for *others*. In each set, an `r` stands for read, a `w`stands for write, and an `x` stands for execute.

If the `r`, `w`, or `x` character is present that file permission is granted. If the letter is not present and a `-` appears instead, that file permission is not granted.

One way to use `chmod` is to provide the permissions you wish to give to the owner, group, and others as a 3 digit number.  The leftmost digit represents the owner. The middle digit represents the group. The rightmost digit represents the others. The digits you can use and what they represent are listed here:

- **0:** No permission
- **1:** Execute permission
- **2:** Write permission
- **3:** Write and execute permissions
- **4:** Read permission
- **5:** Read and execute permissions
- **6:** Read and write permissions
- **7:** Read, write and execute permissions

To set the permission to be read, write, and execute (7 from our list) for the *owner;* read and write (6 from our list) for the *group;* and read and execute (5 from our list) for the *others* weβd need to use the digits 765 with the `chmod`command:

```
chmod -R 765 example.txt
```

To set the permission to be read, write and execute (7 from our list) for the *owner*, and read and write (6 from our list) for the *group* and for the *others* weβd need to use the digits 766 with the `chmod` command:

```
chmod 766 example.txt
```

## sudo

<aside>
π‘ Configure sudo to work without a password for the current user:

</aside>

```bash
echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers
```

<aside>
π‘ Check the edit with:

</aside>

```bash
sudo visudo -c
```