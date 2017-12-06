if [[ $OSTYPE == darwin* ]]; then
    [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
else
    [ -f /usr/share/autojump/autojump.sh ] && . /usr/share/autojump/autojump.sh
fi
