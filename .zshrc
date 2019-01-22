export ZSH="$HOME/.oh-my-zsh"

# https://denysdovhan.com/spaceship-prompt/
ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  host          # Hostname section
  time          # Time stampts section
  node          # Node.js section
  exec_time     # Execution time
  line_sep      # Line break
  git           # Git section (git_branch + git_status)
  dir           # Current directory section
  char          # Prompt character
  # hg            # Mercurial section (hg_branch  + hg_status)
  # package       # Package version
  # ruby          # Ruby section
  # elixir        # Elixir section
  # xcode         # Xcode section
  # swift         # Swift section
  # golang        # Go section
  # php           # PHP section
  # rust          # Rust section
  # haskell       # Haskell Stack section
  # julia         # Julia section
  # docker        # Docker section
  # aws           # Amazon Web Services section
  # venv          # virtualenv section
  # conda         # conda virtualenv section
  # pyenv         # Pyenv section
  # dotnet        # .NET section
  # ember         # Ember.js section
  # kubecontext   # Kubectl context section
  # battery       # Battery level and status
  # vi_mode       # Vi-mode indicator
  # jobs          # Background jobs indicator
  # exit_code     # Exit code section
)
SPACESHIP_TIME_SHOW=true
SPACESHIP_BATTERY_SHOW=always

SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_DIR_TRUNC=0

SPACESHIP_USER_SHOW=always
SPACESHIP_USER_SUFFIX=""
SPACESHIP_USER_COLOR="green"

SPACESHIP_HOST_SHOW=always
SPACESHIP_HOST_PREFIX="~"
SPACESHIP_HOST_COLOR="red"

SPACESHIP_NODE_PREFIX=""

SPACESHIP_GIT_PREFIX=""

HYPHEN_INSENSITIVE=true
export UPDATE_ZSH_DAYS=7
# ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS=true
HIST_STAMPS="dd.mm.yyyy"

source $ZSH/oh-my-zsh.sh

# . `brew --prefix`/etc/profile.d/z.sh

# https://github.com/zsh-users/zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias dev="cd ~/dev"
alias ll="ls -lah"

# qubit
alias sql-proxy-stg="cloud_sql_proxy -instances=qubit-apps-eu-stg:europe-west1:staging=tcp:3307"
alias sql-proxy-qfn="cloud_sql_proxy -instances=qubit-apps-eu-prod:europe-west1:qfn=tcp:3307"
alias dp="make deploy-production"
alias ds="make deploy-staging"
alias kp="kubectl --context=aws-eu-prd"
alias ks="kubectl --context=aws-eu-stg"
alias clean-baton="rm **/baton.npmrc"

# system cleanup
alias clean-docker="docker system prune -a"
alias clean-brew="brew cleanup ; rm -rf $(brew --cache)"

# git
alias gcm="git checkout master"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gb="git branch"

alias glog="git --no-pager log --oneline --pretty=oneline"
alias gst="git status"

alias gclean="git clean -dfx && git reset --hard"
alias gl="git pull origin $(git_current_branch)"

alias gaa="git add --all"
alias gc="git commit -m"
alias gam="git commit --amend"
alias gp='git push origin $(git_current_branch)'
alias grbm='git rebase master'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ruby
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile #to enable shims and auto-complete


