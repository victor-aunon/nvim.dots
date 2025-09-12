if status is-interactive
    # Commands to run in interactive sessions can go here
end
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
set -x PATH $HOME/.volta/bin $HOME/.bun/bin $HOME/.nix-profile/bin /nix/var/nix/profiles/default/bin $PATH /usr/local/bin $HOME/.config $HOME/.cargo/bin /usr/local/lib/*

# Uncommment to activate Tmux as default

# if status is-interactive
#     and not set -q TMUX
#     exec tmux
# end

# Comment if you want to use Tmux
if set -q ZELLIJ
else
    zellij
end

starship init fish | source
zoxide init fish | source
atuin init fish | source

set -x PATH $HOME/.cargo/bin $PATH
set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense'

if not test -d ~/.config/fish/completions
    mkdir -p ~/.config/fish/completions
end

if not test -f ~/.config/fish/completions/.initialized
    if not test -d ~/.config/fish/completions
        mkdir -p ~/.config/fish/completions
    end
    carapace --list | awk '{print $1}' | xargs -I{} touch ~/.config/fish/completions/{}.fish
    touch ~/.config/fish/completions/.initialized
end

carapace _carapace | source

# set -x LS_COLORS "di=38;5;67:ow=48;5;60:ex=38;5;132:ln=38;5;144:*.tar=38;5;180:*.zip=38;5;180:*.jpg=38;5;175:*.png=38;5;175:*.mp3=38;5;175:*.wav=38;5;175:*.txt=38;5;223:*.sh=38;5;132"
set -g fish_greeting ""

## Kanagawa
# set -l foreground DCD7BA
# set -l selection 2D4F67
# set -l comment 727169
# set -l red C34043
# set -l orange FF9E64
# set -l yellow C0A36E
# set -l green 76946A
# set -l purple 957FB8
# set -l cyan 7AA89F
# set -l pink D27E99
# 
# # Syntax Highlighting Colors
# set -g fish_color_normal $foreground
# set -g fish_color_command $cyan
# set -g fish_color_keyword $pink
# set -g fish_color_quote $yellow
# set -g fish_color_redirection $foreground
# set -g fish_color_end $orange
# set -g fish_color_error $red
# set -g fish_color_param $purple
# set -g fish_color_comment $comment
# set -g fish_color_selection --background=$selection
# set -g fish_color_search_match --background=$selection
# set -g fish_color_operator $green
# set -g fish_color_escape $pink
# set -g fish_color_autosuggestion $comment
# 
# # Completion Pager Colors
# set -g fish_pager_color_progress $comment
# set -g fish_pager_color_prefix $cyan
# set -g fish_pager_color_completion $foreground
# set -g fish_pager_color_description $comment

# Dracula Color Palette
#
# Foreground: f8f8f2
# Selection: 44475a
# Comment: 6272a4
# Red: ff5555
# Orange: ffb86c
# Yellow: f1fa8c
# Green: 50fa7b
# Purple: bd93f9
# Cyan: 8be9fd
# Pink: ff79c6

# Syntax Highlighting Colors
set -g fish_color_normal f8f8f2
set -g fish_color_command 8be9fd
set -g fish_color_keyword ff79c6
set -g fish_color_quote f1fa8c
set -g fish_color_redirection f8f8f2
set -g fish_color_end ffb86c
set -g fish_color_error ff5555
set -g fish_color_param bd93f9
set -g fish_color_comment 6272a4
set -g fish_color_selection --background=44475a
set -g fish_color_search_match --background=44475a
set -g fish_color_operator 50fa7b
set -g fish_color_escape ff79c6
set -g fish_color_autosuggestion 6272a4
set -g fish_color_cancel ff5555 --reverse
set -g fish_color_option ffb86c
set -g fish_color_history_current --bold
set -g fish_color_status ff5555
set -g fish_color_valid_path --underline

# Default Prompt Colors
set -g fish_color_cwd 50fa7b
set -g fish_color_cwd_root red
set -g fish_color_host bd93f9
set -g fish_color_host_remote bd93f9
set -g fish_color_user 8be9fd

# Completion Pager Colors
set -g fish_pager_color_progress 6272a4
set -g fish_pager_color_background
set -g fish_pager_color_prefix 8be9fd
set -g fish_pager_color_completion f8f8f2
set -g fish_pager_color_description 6272a4
set -g fish_pager_color_selected_background --background=44475a
set -g fish_pager_color_selected_prefix 8be9fd
set -g fish_pager_color_selected_completion f8f8f2
set -g fish_pager_color_selected_description 6272a4
set -g fish_pager_color_secondary_background
set -g fish_pager_color_secondary_prefix 8be9fd
set -g fish_pager_color_secondary_completion f8f8f2
set -g fish_pager_color_secondary_description 6272a4

# --- SSH Agent ---
# Iniciar solo si no está corriendo
if not functions -q ssh-agent -a -e SSH_AUTH_SOCK
    eval (ssh-agent -c | sed 's/^setenv/set -gx/')
end

# Añade tu clave SSH (si no está ya cargada)
# El comando `ssh-add -l` comprueba si ya hay claves cargadas
if not ssh-add -l >/dev/null
    # Si usas macOS, esta es la mejor opción para guardar la passphrase en el Llavero
    # ssh-add --apple-use-keychain ~/.ssh/id_ed25519 > /dev/null

    # Si usas Linux o Windows, usa esta línea en su lugar:
    ssh-add ~/.ssh/Gem12-WSL >/dev/null
end
