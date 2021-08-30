#!/bin/bash

echo "INSTALLING GOOGLE CHROME"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
sudo apt install -f

echo "INSTALLING BASIC PACKAGES"
sudo apt install git fish fonts-firacode fonts-roboto openjdk-8-jdk apt-transport-https ca-certificates gnupg curl

echo "SET FISH AS DEFAULT SHELL"
chsh -s `which fish`

echo "CONFIGURING GIT"
git config --global user.name "Henrique Couto"
git config --global user.email "email@henriquecouto.com.br"
git config --global credential.helper "cache --timeout=259200"

echo "INSTALLING NODEJS"
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install nodejs -y

echo "INSTALLING YARN"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install yarn

echo "INSTALL CREATE REACT APP"
sudo yarn global add create-react-app

echo "INSTALL DOCKER"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io

echo "INSTALL DOCKER COMPOSE"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "INSTALLING OH MY FISH"
fish -c "curl -L https://get.oh-my.fish | fish"

echo "INSTALLING FISH THEME"
fish -c "omf install spacefish"

echo "INSTALLING NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
fish -c "omf install nvm"

echo "INSTALLING VSCODE"
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code

echo "INCREASE WATCHER LIMIT"
echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

echo "INSTALL GSUTILS"
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update
sudo apt-get install google-cloud-sdk
