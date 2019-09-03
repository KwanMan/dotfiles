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

# install iterm
brew cask install iterm2
mkdir -p ~/Library/Application\ Support/iTerm2/DynamicProfiles
ln -s ~/dev/dotfiles/iterm2.json ~/Library/Application\ Support/iTerm2/DynamicProfiles/iterm2.json

brew install zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# install plugins
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
brew install zsh-syntax-highlighting

# install theme
git clone https://github.com/powerline/fonts.git --depth=1 ~/dev/powerline-fonts
~/dev/powerline-fonts/install.sh
rm -rf ~/dev/powerline-fonts
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/themes/spaceship.zsh-theme"

# symlink .zshrc
ln -s ~/dev/dotfiles/.zshrc ~/.zshrc

print "Node is the future, installing nvm"
# We added a NVM auto updater above, but we manually install it first
# here so we can install node in this script
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
source ~/.nvm/nvm.sh
nvm install 12

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
