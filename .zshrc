# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# SETUP

# Enable brew for second user on mac
if uname -a | grep -q 'Darwin'; then
  export PATH=$PATH:/opt/homebrew/bin
fi

# PPROJECTS

function jcurl () { curl "$@" | json_pp | pygmentize -l json }
function jcurl-v () { curl -v "$@" | json_pp | pygmentize -l json }

bindkey -s ^f "tmux-sessionizer\n"

# SSH
alias home='fn() { ssh "$1"@192.168.21."$2" "$3" }; fn'
alias home-pf='fn() { ssh -L "$3":localhost:"$3" "$1"@192.168.21."$2" "$4"}; fn'
alias home-kitty='fn() {kitty +kitten ssh "$1"@192.168.21."$2";}; fn'
alias home-kitty-pf='fn() {kitty +kitten ssh -L "$3":localhost:"$3" "$1"@192.168.21."$2";}; fn'
alias nch-juke='fn() { ssh -oHostKeyAlgorithms=ssh-rsa,ssh-dss -p 21098 jukeuklg@jukesites.com
 }; fn'

# TMUX
alias ta='tmux attach'
alias td='tmux detach'

# SYS UBUNTU 
alias aptupd='sudo apt update'
alias aptupg='sudo apt upgrade'
alias aptins='fn() { sudo apt install $1 }; fn'
alias aptcln='sudo apt autoremove && sudo apt autoclean'
my-ip() { ip addr | grep -Po 'inet \K[\d.]+' | sort -nr | tr "\n" "  " ;};
alias me='echo $(whoami) $(uname -n) $(uname -s) $(my-ip)'

# SYS MAC
alias bins='fn() { brew install $1 }; fn'

# SYS TERM
alias rmv='rm -rf'
alias src-zsh='source ~/.zshrc; clear'
alias cl='clear'
alias x='exit'
alias mkd='fn() { mkdir "$1" && cd "$1"; }; fn'
alias we='watch echo'
alias src='fn() { source ./"$1"/bin/activate }; fn'
alias ls-cmd='fc -l -n 1 | fzf | xargs -r -I {} /bin/zsh -c "{}"'

# GIT:
alias gint='git init && git branch -m main'
alias gst='git status'
alias gsm='git switch master'
alias gsn='git switch main'
alias gsd='git switch develop'
alias gsb='fn() { git switch "$1" ;}; fn'
alias gcb='fn() { git checkout -b "$1" ;}; fn'
alias gca='git checkout .'
alias gaa='git add .'
alias gcm='fn() { git commit -m "$1" ;}; fn'
alias gac='fn() { git add .; git commit -m "$1" ;}; fn'
alias gct='fn() { git add .; git commit -m "$1" ; git push;}; fn'
alias gbr='fn() { git branch -D "$1" ;}; fn'
alias gph='git push'
alias gpl='git pull'
alias gmr='fn() { git merge "$1" ;}; fn'
alias gbl='git branch'
alias gpub='fn() { git push --set-upstream origin `git rev-parse --abbrev-ref HEAD` }; fn'
alias glg='git log -r -n 10 --pretty=format:"%h - %an, %ar : %s"'
alias glg-last-cmt='git log -n 1 --pretty=format:%H'
alias glg-tree='git log --oneline --decorate --graph -n 20'
alias glg-tree-detail='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' -n 20'
alias gdf-up='git diff @\{upstream\} | nvim'
alias gdf-master='git diff master | nvim'
alias gdf-main='git diff main | nvim'
alias gdf-conf='git diff --name-only --diff-filter=U --relative'
alias gdf='git diff | nvim -'
alias gbr-local='fn() { git branch | grep -v "$1" | xargs git branch -D; }; fn'
alias wgst='watch -n 1 git status'
alias grv='fn() { git reset --"$1" HEAD~"$2" }; fn'

## github
alias pr-create='gh pr create'
alias pr-list='gh pr list'
alias pr-ready='fn() { gh pr ready "$1" ;}; fn() '
alias pr-diff='fn() { gh pr diff "$1" ;}; fn() '
alias pr-status='fn() { gh pr status "$1" ;}; fn() '

# DEV SERVERS
alias nrs='npm run serve'
alias nrd='npm run dev'
alias nst='npm start'
alias yd='yarn dev'
alias yb='yarn build'
alias ys='yarn start'

# GIT STASH
alias gsta='fn() { git add .; git stash save "$1"; }; fn'
alias gstl='git stash list'
alias gstp='fn() { git stash pop stash@\{"$1"\} }; fn'
alias gstd='fn() { git stash drop stash@\{"$1"\} }; fn'

# NVIM
alias nv='nvim'
alias lv='NVIM_APPNAME="lazyvim" nvim'

# WSL Specific
alias syncth-bg='syncthing > /dev/null &'

# DOCKER
alias dc-ls='docker ps'
alias dc-ps='docker ps'
alias dc-killall='docker kill $(docker ps -q)'
alias dc-ka='docker kill $(docker ps -q)'
alias dc-stop='fn() { docker kill $(docker ps -qf expose=$1) }; fn'
alias dc-st='fn() { docker kill $(docker ps -qf expose=$1) }; fn'
alias dc-run='fn() { docker run -it -p $1:$1 $2 }; fn'
alias dc-clean='docker rmi -f $(docker images -a -q)'
alias dc-img='docker images -a'
alias dc-sh='fn() { docker exec -it $(docker ps -qf expose=$1) sh }; fn'
alias dc-up='docker compose up'
alias dc-down='docker compose down'

#UTILS
alias rsh="source ~/.zshrc"
alias edit-hosts='fn() { sudo nvim /etc/hosts && sudo dscacheutil -flashcache}; fn'
alias dus='fn() { du -h --max-depth=1 $1 | sort -hr }; fn'
alias dfh="df -h | grep home | awk '{print \$4}'"
alias rmv-dirs='fn() { find . -name $1 -type d -prune -exec rm -rf '{}' + }; fn'
alias cheat='fn() { curl cheat.sh/$1 }; fn'
alias vt="vtop -t nord"
alias tt="taskwarrior-tui"

# NVM CONFIG
NVM_LOADER=/usr/share/nvm/init-nvm.sh
if [ -f "$NVM_LOADER" ]; then
  source "$NVM_LOADER"
else
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This
fi

# ENVS
export PATH="$HOME/app-repos/adr-tools/src/:$PATH"
export PATH="$HOME/.local/bin:$PATH"
# source "$HOME/.openai_key.zsh"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pnpm
export PNPM_HOME="/home/jake/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# STARTSHIP
eval "$(starship init zsh)"

# ADITIONAL ALIASES
source ~/aliases.zsh


# PYENV
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

alias pyl="pyenv local --unset"
