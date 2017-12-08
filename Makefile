DIR=$(shell git rev-parse --show-toplevel)
OS=$(shell uname)
NOW=$(shell date '+%Y%m%d%H%M%S')


all: prepare vi tmux zsh git

.PHONY: prepare
prepare:
	which git

ifeq ($(OS), Linux)
	sudo apt-get -y install zsh neovim curl
else
	make homebrew
	brew install zsh neovim
endif

.PHONY: vi
vi:
	mkdir -p ~/.config

	if test -a ~/.config/nvim; then mv ~/.config/nvim ~/.config/nvim.$(NOW); fi
	ln -sf $(DIR)/vim ~/.config/nvim

	if test -a ~/.vim; then mv ~/.vim ~/.vim.$(NOW); fi
	ln -sf $(DIR)/vim ~/.vim

	if test -a ~/.vimrc; then mv ~/.vimrc ~/.vimrc.$(NOW); fi
	ln -sf $(DIR)/vim/init.vim ~/.vimrc

	if ! test -a ~/.config/nvim/autoload/plug.vim; then \
		curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; \
	fi
	nvim +PlugInstall +qall

.PHONY: zsh
zsh:
	# oh-my-zsh
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

	if test -a ~/.zshrc; then mv ~/.zshrc ~/.zshrc.$(NOW); fi
	ln -sf $(DIR)/zsh/zshrc ~/.zshrc

	if test -a ~/.zsh-alias.sh; then mv ~/.zsh-alias.sh ~/.zsh-alias.$(NOW); fi
	ln -sf $(DIR)/zsh/alias.sh ~/.zsh-alias.sh

	if test -a ~/.zsh-export.sh; then mv ~/.zsh-export.sh ~/.zsh-export.$(NOW); fi
	ln -sf $(DIR)/zsh/export.sh ~/.zsh-export.sh

	if test -a ~/.zsh-package.sh; then mv ~/.zsh-package.sh ~/.zsh-package.$(NOW); fi
	ln -sf $(DIR)/zsh/package.sh ~/.zsh-package.sh

	if test -a ~/.zsh-function.sh; then mv ~/.zsh-function.sh ~/.zsh-function.$(NOW); fi
	ln -sf $(DIR)/zsh/function.sh ~/.zsh-function.sh

.PHONY: tmux
tmux:
	if test -a ~/.tmux.conf; then mv ~/.tmux.conf ~/.tmux.conf.$(NOW); fi
	ln -sf $(DIR)/tmux/tmux.conf ~/.tmux.conf

.PHONY: git
git:
	sh $(DIR)/git/config

	if test -a ~/.gitignore_global; then mv ~/.gitignore_global ~/.gitignore_global.$(NOW); fi
	ln -sf $(DIR)/git/gitignore_global ~/.gitignore_global

.PHONY: homebrew
homebrew:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

.PHONY: packages
packages:
ifeq ($(OS), Linux)
	sudo apt-get -y autojump
else
	brew install autojump
endif
