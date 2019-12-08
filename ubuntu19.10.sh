!/bin/bash

sudo apt-get update \
    && sudo apt-get upgrade -y \
    && sudo apt-get install -y \
	    curl \
        docker.io \
        build-essential \
        terminator \
        zsh \
        powerline fonts-powerline \
        chrome-gnome-shell \
        gnome-tweak-tool \
        unrar zip unzip p7zip-full p7zip-rar rar \
        openjdk-14-jdk \
        lm-sensors psensor hddtemp cpufrequtils\
        htop

echo "Installing Nodejs"
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - \
    && sudo apt-get install -y nodejs

ZSH_PLUGIN_DIR="$HOME/.oh-my-zsh/custom/plugins"
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
    && sudo chsh -s /bin/zsh \
    && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting" --depth 1 \
    && echo "source $ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc" \
    && git clone https://github.com/esc/conda-zsh-completion.git "$ZSH_PLUGIN_DIR/conda-zsh-completion" --depth 1 \
    && echo "source $ZSH_PLUGIN_DIR/conda-zsh-completion/conda-zsh-completion.plugin.zsh" >> "$HOME/.zshrc" \
    && git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_PLUGIN_DIR/zsh-autosuggestions" --depth 1\
    && echo "source $ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh" >> "$HOME/.zshrc" \
    && echo "need to manully change them to ZSH_THEME='agnoster' and mannually add plugins 'zsh-syntax-highlighting', 'conda-zsh-completion', 'zsh-autosuggestions'"


echo "Attempting to change the default terminal"
sudo update-alternatives --config x-terminal-emulator

echo "Install VS Code"
sudo snap install code --classic

echo "Install PyCharm CE"
sudo snap install pycharm-community --classic

echo "Install Postman"
sudo snap install postman

echo "Install Chromium"
sudo snap install chromium

echo "Install Heroku"
sudo snap install --classic heroku

echo "Install VLC"
sudo snap install vlc

echo "Install Digital Ocean Command Line Tool"
sudo snap install doctl

echo "Install Gimp"
sudo snap install gimp

echo "Install Slack"
sudo snap install slack --classic

echo "Enable Ubuntu Firewall enable commonly used portsd and GUI for firewall"
sudo ufw enable \
    && sudo ufw status \
    && sudo ufw allow ssh \
    && sudo ufw allow http \
    && sudo ufw allow https \
    && sudo apt install gufw -y

echo "Redis Desktop Manager"
sudo snap install redis-desktop-manager

echo "Installing Anaconda"
CONDA_DIR=/opt/anaconda3 \
    && wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh -O Anaconda.sh \
    && sudo bash Anaconda.sh -b -p $CONDA_DIR \
    && sudo chown -R $USER:$USER $CONDA_DIR \
    && eval "$($CONDA_DIR/bin/conda shell.bash hook)" \
    && conda init \
    && rm Anaconda.sh \
    && echo "Anaconda installed successfully"

echo "Configuring sensors"
sudo sensors-detect --auto

echo "Installing Additional Packages"
sudo apt install -y ubuntu-restricted-extras

echo "Configuring Docker"
sudo usermod -aG docker ${USER} \
    && sudo systemctl start docker \
    && sudo systemctl enable docker \
    && echo "Successfully configured for docker"