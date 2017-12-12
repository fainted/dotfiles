export EDITOR="nvim"

export LANG="zh_CN.UTF-8"
export LC_ALL="zh_CN.UTF-8"


if [ -n "$TMUX" ]; then
    DISABLE_AUTO_TITLE=true # disable auto-change tmux window title
    export TERM="screen-256color"
fi

export PATH="HOME/bin:$PATH"

if [[ $OSTYPE == darwin* ]]; then
    # GNU core utils
    if [[ -f $(which gls) ]] && [[ -f $(which gmv) ]]; then
        export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
        export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
    fi

    # GNU find utils: find, locate, updatedb, xargs
    if [[ -f $(which gfind) ]] && [[ -f $(which gxargs) ]]; then
        export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
        export MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
    fi
fi
