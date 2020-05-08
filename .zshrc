export ZSH="$HOME/.oh-my-zsh"

[ -f "$HOME/.config/aliasrc" ] && . "$HOME/.config/aliasrc"
[ -f "$HOME/.env" ] && . "$HOME/.env"

if [ -d $ZSH ]; then
    ZSH_THEME=""
    plugins=(
        git
        colored-man-pages
        pyenv
    )

    source $ZSH/oh-my-zsh.sh

    if [ -d "$HOME/.zfunctions" ]; then
	    fpath=( "$HOME/.zfunctions" $fpath )
        autoload -U promptinit; promptinit
        prompt pure
    fi
fi
