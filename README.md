# dotfiles

```sh
# install brew (https://brew.sh)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install useful stuff
brew install yarn --without-node
brew cask install iterm2 homebrew/cask-versions/firefox-developer-edition spectacle visual-studio-code docker

# install oh my zsh (https://ohmyz.sh)
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# oh-my-zsh plugins
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
brew install zsh-syntax-highlighting

# setup git
git config --global user.name "Tommy Kwan"
git config --global user.email "tkwan196@gmail.com"

# copy over .zshrc
```
