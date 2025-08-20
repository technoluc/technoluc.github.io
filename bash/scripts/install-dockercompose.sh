#!/bin/env bash

VER=$(curl -s https://api.github.com/repos/docker/compose/releases/latest|grep tag_name | cut -d '"' -f 4|sed 's/v//g')

sudo curl -L "https://github.com/docker/compose/releases/download/v$VER/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose