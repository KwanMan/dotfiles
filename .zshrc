export ZSH="/Users/tommykwan/.oh-my-zsh"

# ZSH_THEME="avit"
ZSH_THEME="ys"
HYPHEN_INSENSITIVE="true"
export UPDATE_ZSH_DAYS=7
# ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"

plugins=(
  # https://github.com/lukechilds/zsh-nvm
  zsh-nvm
)
source $ZSH/oh-my-zsh.sh

# . `brew --prefix`/etc/profile.d/z.sh

# https://github.com/zsh-users/zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias dev="cd ~/dev"
alias ll="ls -lh"
alias lal="ls -lah"

# qubit
alias sql-proxy-stg="cloud_sql_proxy -instances=qubit-apps-eu-stg:europe-west1:staging=tcp:3307"
alias sql-proxy-qfn="cloud_sql_proxy -instances=qubit-apps-eu-prod:europe-west1:qfn=tcp:3307"
alias dp="make deploy-production"
alias ds="make deploy-staging"
alias kp="kubectl --context=aws-eu-prd"
alias ks="kubectl --context=aws-eu-stg"

# system cleanup
alias clean-docker="docker system prune -a"
alias clean-brew="brew cleanup ; rm -rf $(brew --cache)"
alias clean-baton="rm **/baton.npmrc"

# git
alias gcm="git checkout master"
alias gcb="git checkout -b"
alias gc="git checkout"
alias gb="git branch"

alias glog="git --no-pager log --oneline --pretty=oneline"
alias gst="git status"

alias gclean="git clean -dfx && git reset --hard"
alias gl="git pull"

alias gcommit="git add --all && git commit -m"
alias gamend="git add --all && git commit --amend --no-edit"
alias gp='git push origin $(git_current_branch) -u'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ruby
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile #to enable shims and auto-complete

cd ~/dev
