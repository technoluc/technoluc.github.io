# Customize bashrc

## "take" to mkdir $$ cd into new folder

```
# take= mkdir && cd $1 #

function take {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
  }
```
  
## Add aliases to change directories quicker

```
# changedir aliases #

alias cdd="cd .."
alias ..="cd .."
```