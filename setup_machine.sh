# 0: 出错后立即退出
set -e

# 1: 安装一些必要的包: apt-transport-https wget
sudo apt-get update && sudo apt-get install -y apt-transport-https wget curl

# 2: 安装oh-my-tuna, 配置清华开源镜像源
wget https://tuna.moe/oh-my-tuna/oh-my-tuna.py
sudo python oh-my-tuna.py --global --yes && rm oh-my-tuna.py
sudo apt-get update

# 3: 安装一些常用的包
sudo apt-get install -y git tmux neovim zsh cloc tree ctags cscope sshpass
sudo apt-get install -y gcc g++ gdb make cmake autoconf pstack autoconf libtool
sudo apt-get install -y htop tcpdump ngrep nmap rsync telnet net-tools pstack strace
sudo apt-get install -y redis-tools graphviz protobuf-compiler thrift-compiler texinfo
sudo apt-get install -y ntp   # 时间同步

# 4: 安装pyenv; python 2.7.14, 3.5.4和一些pip3包
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
       libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils \
       tk-dev libxml2-dev libxmlsec1-dev

export PATH="/home/vagrant/.pyenv/bin:$PATH"
eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)"

pyenv install 2.7.14
pyenv install 3.5.4 && pyenv global 3.5.4 && exec "$SHELL"
pip install --upgrade pip && pip install ipython virtualenv icdiff mitmproxy \
      mycli httpie wheel shadowsocks
# TODO maybe anaconda3

# 5: 安装golang SDK
curl -o go-sdk.tar.gz https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xf go-sdk.tar.gz && rm go-sdk.tar.gz
sudo mkdir /usr/local/lib/go
echo 'export GOROOT="/usr/local/go"'     >> go_sdk.sh
echo 'export PATH="$PATH:$GOROOT/bin"'   >> go_sdk.sh
echo 'export GOPATH="/usr/local/lib/go"' >> go_sdk.sh
sudo mv go_sdk.sh /etc/profile.d/

# TODO 另一台虚拟机 使用docker或kubernetes安装各种网络组件(mysql redis rabbitmq)

# TODO dotfiles配置文件设定
# (neo)vim tmux git ssh

# 本地化设置
# sudo dpkg-reconfigure tzdata
# sudo dpkg-reconfigure locales

# apt-get cleanup
sudo apt-get autoremove -y
sudo apt-get clean

# ssh-key & ssh config
ssh-keygen -t rsa -C "chenhaotian93@gmail.com" -b 4096 -f "$HOME/.ssh/id_rsa" -N ""
