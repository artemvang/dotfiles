export ZSH="$HOME/.oh-my-zsh"

[ -f "$HOME/.config/aliasrc" ] && . "$HOME/.config/aliasrc"
[ -f "$HOME/.env" ] && . "$HOME/.env"

if [ -d $ZSH ]; then
    ZSH_THEME=""
    plugins=(
        git
        colored-man-pages
        pyenv
        tmux
        ssh-agent
    )

    source $ZSH/oh-my-zsh.sh

    if [ -d "$HOME/.zfunctions" ]; then
	    fpath=( "$HOME/.zfunctions" $fpath )
        autoload -U promptinit; promptinit
        prompt pure
    fi
fi

if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
