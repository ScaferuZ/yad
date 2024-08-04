export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

alias ..="cd .."
alias ...="cd ../.."

zplug "mafredri/zsh-async", from:github
zplug "zsh-users/zsh-autosuggestions", as:plugin, defer:2

zplug load

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

. ~/exe/z/z.sh

eval "$(starship init zsh)"

TERM=xterm

# bun completions
[ -s "/Users/fruz/.bun/_bun" ] && source "/Users/fruz/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/fruz/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="/usr/local/opt/postgresql@15/bin:$PATH"
