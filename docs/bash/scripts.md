# Scripts

=== "install-docker.sh"

    ``` bash
    #!/bin/env bash

    sudo apt-get remove docker \
        docker-engine \
        docker.io \
        containerd \
        runc

    sudo apt-get update

    sudo apt-get install -y \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt-get update


    sudo apt-get install -y docker-ce \
        docker-ce-cli \
        containerd.io

    sudo usermod -aG docker $USER
    ```

=== "install-dockercompose.sh"

    ``` bash
    #!/bin/env bash

    VER=$(curl -s https://api.github.com/repos/docker/compose/releases/latest|grep tag_name | cut -d '"' -f 4|sed 's/v//g')

    sudo curl -L "https://github.com/docker/compose/releases/download/v$VER/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

    sudo chmod +x /usr/local/bin/docker-compose
    ```

=== "install-thefuck.sh"

    ``` bash
    #!/bin/env bash

    sudo apt install -y python3-dev \
        python3-pip \
        python3-setuptools

    pip3 install thefuck --user

    echo -e '\nexport PATH="$HOME/.local/bin:$PATH" \neval "$(thefuck --alias)"' | sudo tee -a /home/$USER/.bashrc    
    ```