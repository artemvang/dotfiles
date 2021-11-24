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

    zstyle :omz:plugins:ssh-agent agent-forwarding on
    zstyle :omz:plugins:ssh-agent identities id_ed25519

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



# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . '/home/vang/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . '/home/vang/google-cloud-sdk/completion.zsh.inc'; fi

if [ -d "$HOME/.bookmarks" ]; then
  export CDPATH=".:$HOME/.bookmarks:/"
  alias goto="cd -P"
fi
