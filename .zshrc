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
ZSH_THEME="powerlevel10k/powerlevel10k"

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


# SSH
alias home-pf='_fnc() { ssh -L "$3":localhost:"$3" "$1"@192.168.21."$2"}; _fnc'
alias home='_fnc() { ssh "$1"@192.168.21."$2" }; _fnc'
alias judy='_fnc() { ssh judyta@127.0.0.1; }; _fnc'

# SYS UBUNTU 
alias aptupd='sudo apt update'
alias aptupg='sudo apt upgrade'
alias aptins='_fnc() { sudo apt install $1 }; _fnc'
alias aptcln='sudo apt autoremove && sudo apt autoclean'
alias me='echo $(whoami) $(uname -n) $(uname -s) $(ifconfig -l | xargs -n1 ipconfig getifaddr)'

# SYS mac
alias bins='_fnc() { brew install $1 }; _fnc'

# SYS TERM
alias envm='_fnc() { nvim -u ~/.config/nvim/py.lua ~/.config/nvim/$1.lua; cp ~/.config/nvim/$1.lua ~/config-dev/nvim; }; _fnc'
alias ezsh='_fnc() { nvim -u ~/.config/nvim/py.lua ~/.zshrc; cp ~/.zshrc ~/config-dev/; exec zsh; }; _fnc'
alias rzsh='_fnc() { exec zsh; clear; }; _fnc' 
alias etmux='_fnc() { nvim -u ~/.config/nvim/py.lua ~/.tmux.conf; cp ~/.tmux.conf ~/config-dev/; }; _fnc'
alias rmv='rm -rf'
alias cl='clear'
alias x='exit'
alias mkd='_fnc() { mkdir "$1" && cd "$1"; }; _fnc'
alias dev-from-config='cp ~/config-dev/.zshrc ~/ && cp -r ~/config-dev/nvim/*.lua ~/.config/nvim/ && cp ~/config-dev/.tmux.conf ~/ && exec zsh'
alias dev-to-config='cp ~/.zshrc ~/config-dev/ && cp -r ~/.config/nvim/*.lua ~/config-dev/nvim/ && cp ~/.tmux.conf ~/config-dev/'
alias dev-rsync='fn() { rsync -r ~/config-dev/nvim/* "$1"@192.168.21."$2":~/.config/nvim/; rsync ~/.zshrc "$1"@192.168.21."$2":~/; rsync ~/.tmux.conf "$1"@192.168.21."$2":~/}; fn'
alias dev-rsync-raint='fn() { rsync -r ~/config-dev/nvim/* jake@172.23.129.161:~/.config/nvim/; rsync ~/.zshrc jake@172.23.129.161:~/; rsync ~/.tmux.conf jake@172.23.129.161:~/}; fn'

# DEV:
alias gst='git status'
alias gsm='git switch master'
alias gsn='git switch main'
alias gsb='_fnc() { git switch "$1" ;}; _fnc'
alias gcb='_fnc() { git checkout -b "$1" ;}; _fnc'
alias gca='git checkout .'
alias gaa='git add .'
alias gcm='_fnc() { git commit -m "$1" ;}; _fnc'
alias gbr='_fnc() { git branch -D "$1" ;}; _fnc'
alias gph='git push'
alias gpl='git pull'
alias gmr='_fnc() { git merge "$1" ;}; _fnc'
alias gbl='git branch'
alias gpub='_fnc() { git push --set-upstream origin `git rev-parse --abbrev-ref HEAD` }; _fnc'
alias glg='git log | more'
alias glg-short='git log -r -n 10 --pretty=format:"%h - %an, %ar : %s"'
alias glg-last-cmt='git log -n 1 --pretty=format:%H'
alias gdf-conf='git diff --name-only --diff-filter=U --relative'
alias gdf-nvm='git diff | nvim -'
alias gbr-local='_fnc() { git branch | grep -v "$1" | xargs git branch -D; }; _fnc'
alias wgst='watch -n 1 git status'

# DEV SERVERS
alias nrs='npm run serve'
alias nrd='npm run dev'
alias nst='npm start'
alias yd='yarn dev'
alias yb='yarn build'
alias ys='yarn start'

# GIT STASH
alias gsta='_fnc() { git add .; git stash save "$1"; }; _fnc'
alias gstl='git stash list'
alias gstp='_fnc() { git stash pop stash@\{"$1"\} }; _fnc'


# NVIM
alias nvim-old='nvim -u ~/.config/nvim/init.vim__'
alias vu2vim='nvim -u ~/.config/nvim/vu2.lua'
alias vu3vim='nvim -u ~/.config/nvim/vu3.lua'
alias pyvim='nvim -u ~/.config/nvim/py.lua'
alias ravim='nvim -u ~/.config/nvim/ra.lua'

# WSL Specific
alias syncth-bg='syncthing > /dev/null &'


# DOCKER
alias dc-ls='docker ps'
alias dc-syseng-api='docker-compose -f "docker-compose.m1.yml" up --remove-orphans --build'



#######
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
