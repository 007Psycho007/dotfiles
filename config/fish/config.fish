# ~/.config/fish/config.fish

# --- Starship transient prompt integration ---
function starship_transient_prompt_func
    starship module time
end

# --- Environment ---
set -x TERM xterm-kitty

# --- Aliases ---
alias ssh="kitty +kitten ssh"

# --- Prompt ---
starship init fish | source
enable_transience

# --- Keybindings ---
fish_vi_key_bindings

# --- Greeting ---
set fish_greeting
