#!/bin/bash
echo "INSTALLING BASIC PACKAGES"
sudo apt install git fish fonts-firacode openjdk-8-jdk

echo "SET FISH AS DEFAULT SHELL"
chsh -s `which fish`

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

echo "INSTALL CREATE REACT APP"
sudo yarn global add create-react-app

echo "INSTALL FIREBASE TOOLS"
sudo yarn global add firebase-tools

echo "INSTALLING OH MY FISH"
fish -c "curl -L https://get.oh-my.fish | fish"

echo "INSTALLING FISH THEME"
fish -c "omf install spacefish"

echo "INSTALLING NVM"
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
fish -c "omf install nvm"

echo "INSTALLING GOOGLE CHROME"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

echo "INSTALLING VSCODE"
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code

echo "INSTALLING VSCODE EXTENSIONS"
echo "----- Auto Rename Tag"
code --install-extension formulahendry.auto-rename-tag

echo "----- Auto Close Tag"
code --install-extension formulahendry.auto-close-tag

echo "----- Highlight Matching Tag"
code --install-extension vincaslt.highlight-matching-tag

echo "----- Auto Complete Tag"
code --install-extension formulahendry.auto-complete-tag

echo "----- Color Highlight"
code --install-extension naumovs.color-highlight

echo "----- Prettier - Code formatter"
code --install-extension esbenp.prettier-vscode

echo "----- ESLint"
code --install-extension dbaeumer.vscode-eslint

echo "----- Bracket Pair Colorizer"
code --install-extension CoenraadS.bracket-pair-colorizer

echo "----- Material Icon Theme"
code --install-extension PKief.material-icon-theme

echo "----- One Dark Pro"
code --install-extension zhuangtongfa.Material-theme

echo "----- GitLens"
code --install-extension eamodio.gitlens

echo "INCREASE WATCHER LIMIT"
echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
