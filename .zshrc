# Allow for global devbox packages (nix)
eval "$(devbox global shellenv)"

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

source <(fzf --zsh)

# -- Use fd instead of fzf --
#export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# --- setup fzf theme ---
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# ---- Eza (better ls) -----
alias ls="eza --color=always --long --git --icons=always"

# ICU for charlock_holmes
export PATH="/opt/homebrew/opt/icu4c@75/bin:$PATH"
export PATH="/opt/homebrew/opt/icu4c@75/sbin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/icu4c@75/lib"
export CPPFLAGS="-I/opt/homebrew/opt/icu4c@75/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/icu4c@75/lib/pkgconfig"

# Libpq for pg
export PKG_CONFIG_PATH="/opt/homebrew/opt/libpq/lib/pkgconfig"

# Hide warnings from podman
export PODMAN_COMPOSE_WARNING_LOGS=false
source /opt/homebrew/share/zsh/site-functions

export THOR_SILENCE_DEPRECATION=true

export EDITOR=zed
alias cat="bat"

alias g="git"
alias gs="git status"
alias gpd="git fetch origin develop:develop"
alias gpm="git fetch origin main:main"
alias gcc="git commit -m"
alias gp="git push"
alias gc="git checkout"
alias grb="git rebase develop"

alias lg=lazygit

alias db="devbox"
alias dbr="devbox run"
alias dbu="devbox services up -b"
alias dbd="devbox services stop"

alias dash="gh dash"
alias enhance="gh enhance"

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# Forgit is a simple cli tool for git
# https://github.com/wfxr/forgit
[ -f $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh ] && source $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh

# pnpm
export PNPM_HOME="/Users/steven/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Android SDK
export ANDROID_HOME="/Users/steven/Library/Android/sdk"

export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# For cognito SSL
export AWS_CA_BUNDLE=/opt/homebrew/etc/openssl@3/cert.pem

# Fix for openssl on ruby 3.3.6
export RUBYOPT="-r$HOME/.rubyopenssl_default_store.rb $RUBYOPT"

# Homebrew settings
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_ENV_HINTS=1

# bun completions
[ -s "/Users/steven/.bun/_bun" ] && source "/Users/steven/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Starship, this should be last
eval "$(starship init zsh)"
