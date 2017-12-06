function urlencode() {
    echo $@ | tr -d "\n" | xxd -plain | sed "s/\(..\)/%\1/g"
}

function urldecode() {
    printf $(echo -n $@ | sed 's/\\/\\\\/g;s/\(%\)\([0-9a-fA-F][0-9a-fA-F]\)/\\x\2/g')"\n"
}

function public_ip() {
    dig +short myip.opendns.com @resolver1.opendns.com
}

function ips() {
    # TODO interface name (ls /sys/class/net)
    ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'
}
