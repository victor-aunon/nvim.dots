eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# Detectar OS para cargar la config de Zellij correcta
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Estamos en Mac
    alias zellij='zellij --config ~/.config/zellij/config.macos.kdl'
else
    # Estamos en Linux/Windows WSL
    alias zellij='zellij --config ~/.config/zellij/config.kdl'
fi

# --- ZSH AUTOSUGGESTIONS (Predictivo tipo Fish) ---
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Forzamos el color gris de Drácula para la sugerencia
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6272a4"

# --- ZSH SYNTAX HIGHLIGHTING ---
# 1. Cargar el plugin (usando la ruta de Homebrew en Mac)
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# 2. Inyectar el tema Drácula al resaltado
typeset -gA ZSH_HIGHLIGHT_STYLES

# Comandos base
ZSH_HIGHLIGHT_STYLES[command]='fg=#8be9fd,bold'         # Verde: Comandos válidos (cd, ls, git)
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ff5555,bold'   # Rojo: Comandos que no existen o errores
ZSH_HIGHLIGHT_STYLES[alias]='fg=#8be9fd,bold'           # Verde: Tus alias
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#8be9fd,bold'         # Verde: Comandos integrados

# Rutas y argumentos
ZSH_HIGHLIGHT_STYLES[path]='fg=#bd93f9'                 # Rosa: Rutas de carpetas/archivos válidas
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#bd93f9'          # Rosa: Rutas parciales
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#ffb86c' # Cyan: Flags cortos (-v)
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#ffb86c' # Cyan: Flags largos (--version)

# Strings y otros
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#f1fa8c' # Amarillo: 'textos'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#f1fa8c' # Amarillo: "textos"
ZSH_HIGHLIGHT_STYLES[assign]='fg=#ffb86c'                 # Naranja: Asignaciones (VAR=valor)
ZSH_HIGHLIGHT_STYLES[comment]='fg=#6272a4'           # Gris oscuro: Comentarios (#)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
