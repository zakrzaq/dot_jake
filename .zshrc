# export PATH=$HOME/bin:/usr/local/bin:$PATH

# ALIASES
[ -f ~/aliases.zsh ] && source ~/aliases.zsh

# LOCAL BIN
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

# OH_MY_ZSH
[ -d "$home/.oh-my-zsh" ] && export ZSH="$HOME/.oh-my-zsh"
[ -d "$home/.oh-my-zsh" ] && source $ZSH/oh-my-zsh.sh

# BREW MAC MULTI USER
if uname -a | grep -q 'Darwin'; then
  export PATH=$PATH:/opt/homebrew/bin
fi

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# PNPM
export PNPM_HOME="/home/jake/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# PYENV
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
alias pyl="pyenv local --unset"

# STARSHIP
eval "$(starship init zsh)"
