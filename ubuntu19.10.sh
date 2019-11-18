#!/bin/bash

sudo apt-get update \
    && sudo apt-get upgrade -y \
    && sudo apt-get install -y \
        docker.io \
        build-essential \
        terminator \
        zsh \
        powerline fonts-powerline \

echo "Installing Nodejs"
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - \
    && sudo apt-get install -y nodejs

git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
    && chsh -s /bin/zsh \
    && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth 1 \
    && echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc" \
    && echo "need to manully change them to ZSH_THEME='agnoster'"

echo "Install VS Code"
sudo snap install vscode --classic

echo "Install PyCharm CE"
sudo snap install pycharm-community --classic

echo "Install Postman"
sudo snap install postman

echo "Install Chromium"
sudo snap install chromium

echo "Install Heroku"
sudo snap install --classic heroku

echo "Attempting to change the default terminal"
sudo update-alternatives --config x-terminal-emulator

echo "Install Digital Ocean Command Line Tool"
sudo snap install doctl

echo "Installing Anaconda"
CONDA_DIR=/opt/anaconda3 \
    && sudo mkdir -p $CONDA_DIR \
    && sudo chown -R $USER:$USER $CONDA_DIR \
    && wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh -O Anaconda.sh \
    && bash Anaconda.sh -b -p $CONDA_DIR \
    && sudo chown -R $USER:$USER $CONDA_DIR \
    && eval "$($CONDA_DIR/bin/conda shell.bash hook)" \
    && eval "$($CONDA_DIR/bin/conda shell.bash hook)" \
    && conda init