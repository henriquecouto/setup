#!/bin/bash
echo "INSTALLING PACKAGES"
sudo apt install git fish fonts-firacode

echo "SET FISH AS DEFAULT SHELL"
sudo chsh -s `which fish`

echo "CONFIGURING GITHUB"
git config --global user.name "Henrique Couto"
git config --global user.email "henrique.coutu@live.com"
git config --global credential.helper "cache --timeout=86400"

echo "INSTALLING NODEJS"
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
sudo apt install nodejs -y

echo "INSTALLING YARN"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install yarn

echo "INSTALLING FISH THEME"
fish -c "omf install bobthefish"

echo "INSTALLING NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
fish -c "omf install nvm"


