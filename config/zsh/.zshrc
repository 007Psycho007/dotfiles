#### Oh my ZSH Init
export ZSH="$HOME/.oh-my-zsh"
plugins=(git fast-syntax-highlighting sudo vi-mode)

source $ZSH/oh-my-zsh.sh

### Plugin Configuration
if [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting ]; then
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
fi
#### Finished OMZ 

### Transient Prompt Config
zle-line-init() {
  emulate -L zsh

  [[ $CONTEXT == start ]] || return 0

  while true; do
    zle .recursive-edit
    local -i ret=$?
    [[ $ret == 0 && $KEYS == $'\4' ]] || break
    [[ -o ignore_eof ]] || exit 0
  done

  local saved_prompt=$PROMPT
  local saved_rprompt=$RPROMPT
  PROMPT='$(STARSHIP_CONFIG=~/.config/starship-transient.toml starship prompt --terminal-width="$COLUMNS" --keymap="${KEYMAP:-}" --status="$STARSHIP_CMD_STATUS" --pipestatus="${STARSHIP_PIPE_STATUS[*]}" --cmd-duration="${STARSHIP_DURATION:-}" --jobs="$STARSHIP_JOBS_COUNT")'
  RPROMPT=''
  zle .reset-prompt
  PROMPT=$saved_prompt
  RPROMPT=$saved_rprompt

  if (( ret )); then
    zle .send-break
  else
    zle .accept-line
  fi
  return ret
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/psycho/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/psycho/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/psycho/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/psycho/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
conda config --set changeps1 False

# Aliases 
# NVIM
alias vim="nvim --listen ~/.cache/nvim/server.pipe"
alias org="vim ~/notes"
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

if [ -f "/usr/bin/lazygit" ] || [ -f ~/go/bin/lazygit ]; then
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

export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"
zle -N zle-line-init
