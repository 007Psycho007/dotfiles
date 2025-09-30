# ~/.config/fish/config.fish

# --- Starship transient prompt integration ---
function starship_transient_prompt_func
    starship module time
end

# --- Environment ---
set -x TERM xterm-kitty

# --- Aliases ---
alias ssh="kitty +kitten ssh"
alias ns="nix-shell --extra-experimental-features flakes"
alias nx="nix --extra-experimental-features nix-command --extra-experimental-features flakes"

# --- Prompt ---
starship init fish | source
enable_transience

# --- Keybindings ---
fish_vi_key_bindings

# --- Any-nix-shell integration ---
any-nix-shell fish | source

# --- Greeting ---
set fish_greeting
