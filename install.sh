cp -f vimrc $HOME/.vimrc
if command -v nvim 1>/dev/null 2>&1; then
  mkdir -p $HOME/.config/nvim
  cp -f vimrc $HOME/.config/nvim/init.vim
fi

cp -f shrc $HOME/.bashrc
cp -f shrc $HOME/.zshrc

cp -f gitconfig $HOME/.gitconfig
cp -f gitignore_global $HOME/.gitignore_global

cp -f tmux.conf $HOME/.tmux.conf
