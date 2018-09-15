#!/bin/sh

print () {
  echo ""
  echo "->"
  echo "--->"
  echo "----->"
  echo "-------> ${1}"
  echo "----->"
  echo "--->"
  echo "->"
  echo ""
}

print "Cloning repo"
mkdir -p ~/dev/dotfiles
git clone https://github.com/KwanMan/dotfiles.git ~/dev/dotfiles

if [ ! -f $HOME/.ssh/id_rsa ]; then
  print "Generating SSH key"
  ssh-keygen -t rsa -b 4096 -f "$HOME/.ssh/id_rsa"
fi

if [ -z "$(type -fp brew)" ]; then
  print "First things first, can't function without brew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

print "Let's get a better terminal setup"
brew cask install iterm2
brew install zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
brew install zsh-syntax-highlighting
ls -s ~/dev/dotfiles/.zshrc ~/.zshrc

print "Node is the future, installing nvm"
# We added a NVM auto updater above, but we manually install it first
# here so we can install node in this script
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source ~/.nvm/nvm.sh
nvm install 10

print "The rest of your homely dev setup"
git config --global user.name "Tommy Kwan"
git config --global user.email "tkwan196@gmail.com"
brew install yarn --without-node
brew cask install homebrew/cask-versions/firefox-developer-edition
brew cask install google-chrome-canary
brew cask install visual-studio-code
brew cask install docker
brew cask install google-cloud-sdk

print "And the stuff you use all the time"
brew cask install spectacle
brew cask install spotify
brew cask install telegram
brew cask install whatsapp

print "All done, now sending you to your new shell"
chsh -s /bin/zsh
