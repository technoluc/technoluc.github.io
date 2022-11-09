# Useful Commands 

## Update all

```bash
sudo apt-get update && sudo apt-get upgrade -y
```

## 📝Shell scripts

<aside>
💡 One example of an easy script

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

## 🔗Command Chaining

### (;) The Semicolon Operator

<aside>
💡 A ; B  – Run A and then B, regardless of the success or failure of A

</aside>

### (&&) The Logical AND Operator

<aside>
💡 A && B  – Run B only if A succeeded

</aside>

### (||) The Logical OR Operator

<aside>
💡 A || B  – Run B only if A failed

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
💡 echo <b>-e </b> : for option \n

</aside>

<aside>
💡 <b>\n</b>  : creates new line from where it is used.

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
💡 (change ssl=1 to ssl=0 in file /etc/webmin/miniserv.conf

</aside>

```bash
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf

```

---

## wget/curl

### wget

<aside>
💡 Download file to current directory

</aside>

```bash
wget "http://domain.com/directory/4?action=AttachFile&do=view&target=file.tgz"
```

<aside>
💡 download file to /home/${USER}/Desktop/

</aside>

```bash
wget  -P /home/${USER}/Desktop/ "http://thecanadiantestbox.x10.mx/CC.zip"

```

<aside>
💡 download file as /home/${USER}/Desktop/NewFileName

</aside>

```bash
wget  -O /home/${USER}/Desktop/NewFileName "http://thecanadiantestbox.x10.mx/CC.zip"

```

---

### curl

<aside>
💡 Download file to current directory

</aside>

```bash
curl –O [URL]
```

<aside>
💡 Download file as filename

</aside>

```bash
curl –o [filename] [URL]
```

---

## dpkg

<b> Install .deb Package Using Dpkg </b>

```bash
sudo dpkg --install [.deb file]
```

<aside>
💡 This command will fix the broken package and install the required dependencies assuming they are available in the system repository.

</aside>

```bash
sudo apt -f install
```

<b> Remove Installed Package Using Dpkg </b>

<aside>
💡 To find out the exact package name, you can use the following command with any keyword related to the package name:

</aside>

```bash
dpkg –l | grep keyword
```

```bash
sudo dpkg --remove [package file]
```

## chmod

<aside>
💡 The `chmod` command [sets the file permissions flags](https://www.howtogeek.com/67987/htg-explains-how-do-linux-file-permissions-work/) on a file or folder. The flags define who can read, write to or execute the file. When you list files with the `-l` (long format) option you’ll see a string of characters that look like

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

To set the permission to be read, write, and execute (7 from our list) for the *owner;* read and write (6 from our list) for the *group;* and read and execute (5 from our list) for the *others* we’d need to use the digits 765 with the `chmod`command:

```
chmod -R 765 example.txt
```

To set the permission to be read, write and execute (7 from our list) for the *owner*, and read and write (6 from our list) for the *group* and for the *others* we’d need to use the digits 766 with the `chmod` command:

```
chmod 766 example.txt
```

## sudo

<aside>
💡 Configure sudo to work without a password for the current user:

</aside>

```bash
echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers
```

<aside>
💡 Check the edit with:

</aside>

```bash
sudo visudo -c
```

## Grep

To search for a text in a file, use the grep command.

```
grep -i "hello" hello.txt
Hello World
```

this will search for the text “hello” in the file hello.txt. Adding -i will ignore the case.

Adding -E will allows us to search for multiple items using | as a separator

example: 

```bash
kubectl describe po grafana-59b7f4d459-ksw62 | grep -E -i "image|port"
```

## Cut

To extract parts of a string, use the cut command.

```
echo "Hello World" | cut -c 1-5
Hello
```

```
cut -c 1-5 hello.txt
Hello
123
```

will extract the 1–5 character of the string “Hello World” or the first 5 characters of each line in the file hello.txt.

```
pwd
/Users/guyzsarun/Desktop
```

```
pwd | cut -f 4 -d "/"
Desktop
```

-f 4 will extract the 4th field of the string "/Users/guyzsarun/Desktop"

-d "/" will use / as the separator.

## Awk

awkcommand is used to extract parts of a string line by line

``` 
docker -v
Docker version 20.10.17, build 100c701
```


```
docker -v | awk '{print $3,$5}'
20.10.17, 100c701
```

this will print the version of docker and the build number splitting the string by spaces. $3 will print the version and $5 will print the build number.

```
java --version
openjdk 18.0.2 2022-07-19
OpenJDK Runtime Environment Homebrew (build 18.0.2+0)
OpenJDK 64-Bit Server VM Homebrew (build 18.0.2+0, mixed mode, sharing)
```

For this example, if we want to get only the version from the first line, we can specify the line number using NR==1.

```
java --version | awk 'NR==1 {print $2}'
18.0.2
```

or we can search for terms that we want. for example, matching the line with the word VM and select the second field.

```
java --version | awk '/VM/ {print $2}'
64-Bit
```
