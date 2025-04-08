#!/bin/bash
################################################
# Cleanup Linux Installation
# Author: Thomas Burger
# Version 1.4
# Date: 2020-10-23
################################################

counter=0

### Cleaning up
clear
echo "### CLEANING UP LINUX INSTALLATION"


# /var/log
myPath="/var/log"
if [[ -d "$myPath" ]] ;
    then
        echo "Cleaning up >$myPath<"
        myPathContent=$null
        myPathContent=`sudo find $myPath`
        for file in $myPathContent ;
            do
                delete="false"
                postdot=""
                postdot=$(echo $file | rev | cut -d. -f1 | rev)
                if [[ "$postdot" == "0" ]] ;
                    then
                        delete="true"
                elif [[ "$postdot" == "1" ]] ;
                    then
                        delete="true"
                elif [[ "$postdot" == "gz" ]] ;
                    then
                        delete="true"
                fi
                
                if [[ "$delete" == "true" ]] ;
                    then
                        #echo "delete >$file<"
                        if ! [[ -d "$file" ]] ;
                            then
                                sudo rm -f "$file"
                                counter=$(($counter+1))
                        fi
                fi
        done
fi


# /var/log/journal
myPath="/var/log/journal"
if [[ -d "$myPath" ]] ;
    then
        echo "Cleaning up >$myPath<"
        myPathContent=$null
        myPathContent=`sudo find "$myPath" -mtime +3`
        for file in $myPathContent ;
            do
                #echo "delete >$file<"
                if ! [[ -d "$file" ]] ;
                    then
                        sudo rm -f "$file"
                        counter=$(($counter+1))
                fi
        done
fi


# /var/log.save
myPath="/var/log.save"
if [[ -d "$myPath" ]] ;
    then
        echo "Cleaning up >$myPath<"
        myPathContent=$null
        myPathContent=`sudo find $myPath`
        for file in $myPathContent ;
            do
                delete="false"
                postdot=""
                postdot=$(echo $file | rev | cut -d. -f1 | rev)
                if [[ "$postdot" == "0" ]] ;
                    then
                        delete="true"
                elif [[ "$postdot" == "1" ]] ;
                    then
                        delete="true"
                elif [[ "$postdot" == "gz" ]] ;
                    then
                        delete="true"
                fi
                
                if [[ "$delete" == "true" ]] ;
                    then
                        #echo "delete >$file<"
                        if ! [[ -d "$file" ]] ;
                            then
                                sudo rm -f "$file"
                                counter=$(($counter+1))
                        fi
                fi
        done
fi


# /var/log.save/journal
myPath="/var/log.save/journal"
if [[ -d "$myPath" ]] ;
    then
        echo "Cleaning up >$myPath<"
        myPathContent=$null
        myPathContent=`sudo find "$myPath" -mtime +3`
        for file in $myPathContent ;
            do
                #echo "delete >$file<"
                if ! [[ -d "$file" ]] ;
                    then
                        sudo rm -f "$file"
                        counter=$(($counter+1))
                fi
        done
fi


# /var/cache/e2fsck
myPath="/var/cache/e2fsck"
if [[ -d "$myPath" ]] ;
    then
        echo "Cleaning up >$myPath<"
        myPathContent=$null
        myPathContent=`sudo find "$myPath" -mtime +3`
        for file in $myPathContent ;
            do
                #echo "delete >$file<"
                if ! [[ -d "$file" ]] ;
                    then
                        sudo rm -f "$file"
                        counter=$(($counter+1))
                fi
        done
fi


# /lib/modules AND /boot
kernelVersion=`uname -r`
myPath="/lib/modules"
echo "Cleaning up >$myPath<"
myPathContent=$null
myPathContent=`ls -1 "$myPath"`
for item in $myPathContent ;
    do
        if [[ "$item" == "$kernelVersion" ]] ;
            then
                #echo "break the loop"
                break
            else
                #echo "delete >$myPath/$item<"
                if ! [[ -d "$file" ]] ;
                    then
                        sudo rm -rf "$myPath/$item"
                        counter=$(($counter+1))
                
                        #boot files
                        correspondingBootFiles=`sudo find /boot | grep $item`
                        for bootItem in $correspondingBootFiles ;
                            do
                                #echo "delete >$bootItem<"
                                if ! [[ -d "$file" ]] ;
                                    then
                                        sudo rm -f "$bootItem"
                                        counter=$(($counter+1))
                                fi
                        done
                fi
        fi
done


echo "Cleaning up configuration files from removed packages"
sudo dpkg -l | awk '/^rc/{print $2}' | sudo xargs apt-get purge -y


# update grub
echo "Updating grub"
sudo update-grub


# Cleanup apt cache
echo "Cleaning up apt-cache via apt-get"
sudo apt-get clean -y
sudo apt-get autoremove -y


# /etc/apt/cache
myPath="/etc/apt/cache"
echo "Cleaning up >$myPath<"
if [[ -d "$myPath" ]] ;
    then
        myPathContent=$null
        myPathContent=`sudo find "$myPath/*"  -mtime +3`
        for item in $myPathContent ;
            do
                #echo "delete >$item<"
                if ! [[ -d "$file" ]] ;
                    then
                        sudo rm -f "$item"
                        counter=$(($counter+1))
                fi
        done
fi


# Closing down
echo "Cleaned up $counter elements."
echo "     Current state:"
sudo df -h /
