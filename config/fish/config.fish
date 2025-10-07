# ~/.config/fish/config.fish
set -gx STARSHIP_CONFIG ~/.config/starship/starship-generated.toml

# --- Starship transient prompt integration ---
function starship_transient_prompt_func
    starship module time
end

# --- Colorscheme ---
# Load global colors
set -l colorfile ~/.config/colors/current.env
for line in (cat $colorfile)
    if test (string match -r "^export " $line)
        set key (echo $line | cut -d'=' -f1 | cut -d' ' -f2)
        set value (echo $line | cut -d'=' -f2-)
        set -gx $key (string trim -c '"' $value)
    end
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
