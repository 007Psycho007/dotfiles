# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
POWERLEVEL9K_MODE='awesome-patched'
# Path to your oh-my-zsh installation.
ZSH_DISABLE_COMPFIX="true"
export ZSH="/home/$(whoami)/.oh-my-zsh"

export TERMINAL=alacritty
 #Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon user dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history)
POWERLEVEL9K_USER_DEFAULT_BACKGROUND='darkorange'
POWERLEVEL9K_USER_DEFAULT_FOREGROUND='black'
POWERLEVEL9K_USER_ROOT_BACKGROUND='darkorange'
POWERLEVEL9K_USER_ROOT_FOREGROUND='black'
POWERLEVEL9K_OS_ICON_BACKGROUND='darkorange'
POWERLEVEL9K_OS_ICON_FOREGROUND='black'
POWERLEVEL9K_DIR_SHOW_WRITABLE="true"
POWERLEVEL9K_PROMPT_ON_NEWLINE="true"
POWERLEVEL9K_RPROMPT_ON_NEWLINE="true"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%{%F{249}%}\u250f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%F{249}%}\u2517%{%F{default}%} "
POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git sudo vi-mode zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration
VI_MODE_SET_CURSOR=true

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#export DISPLAY=$(ip route|awk '/^default/{print $3}'):1.0

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/$(whoami)/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
	if [ -f "/home/$(whoami)/anaconda3/etc/profile.d/conda.sh" ]; then
		. "/home/$(whoami)/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/$(whoami)/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
conda activate base
# <<< conda initialize <<<


# Aliases 
# NVIM
alias vim="nvim --listen ~/.cache/nvim/server.pipe"
alias vimconf="nvim /home/$(whoami)/.config/nvim"
alias i3conf="nvim /home/$(whoami)/.config/i3/config"
alias polyconf="nvim /home/$(whoami)/.config/polybar/"
alias zshconf="nvim /home/$(whoami)/.zshrc; source /home/$(whoami)/.zshrc"

# Clear
alias cls='printf "\033c"'
# Folder Movement
alias ..="cd .."
alias ...="cd ../.."

# Folder Alternatives

if [ -f "/usr/bin/lsd" ] || [ -f "/home/jpeterhaensel/.cargo/bin/lsd" ]; then
    alias ll="lsd -l"
    alias ls="lsd"
    alias la="lsd -a"
fi

# Progamcalls
alias sshmount="sudo sshfs -o allow_other,IdentityFile=/home/$(whoami)/.ssh/id_rsa"
alias bctl=bluetoothctl

if [ -f "/usr/bin/batcat" ]; then
	alias bat="batcat"
fi
# Nala 

if [ -f "/usr/bin/nala" ]; then
    alias apt="sudo nala"
fi

if [ -f "/usr/bin/lazygit" ]; then
    alias lg="lazygit"
fi

alias pwgen="openssl rand -base64 32"
export SUDO_EDITOR=/usr/bin/nvim

# kitty 

alias ssh='env TERM=xterm-256color ssh' # allows kitty to work with ssh



if [ -f "/home/$(whoami)/.emacs.d/bin/doom" ]; then
	export PATH="/home/$(whoami)/.emacs.d/bin:$PATH"
fi

if [ -d "/home/$(whoami)/.cargo/bin" ]; then
	export PATH="/home/$(whoami)/.cargo/bin:$PATH"
fi

if [ -d "/home/$(whoami)/go/bin" ]; then
	export PATH="/home/$(whoami)/go/bin:$PATH"
fi

if [ -d "/home/$(whoami)/.local/bin" ]; then
	export PATH="/home/$(whoami)/.local/bin:$PATH"
fi
