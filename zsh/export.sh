export EDITOR="nvim"

export LANG="zh_CN.UTF-8"
export LC_ALL="zh_CN.UTF-8"


if [ -n "$TMUX" ]; then
    DISABLE_AUTO_TITLE=true # disable auto-change tmux window title
    export TERM="screen-256color"
fi

export PATH="HOME/bin:$PATH"
