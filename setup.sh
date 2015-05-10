mkdir -p bak
mv ~/.bashrc bak/
mv ~/.tmux.conf bak/
mv ~/.inputrc bak/
mv ~/.gitconfig bak/
mv ~/.i3/config bak/
mv ~/.zshrc bak/
mv ~/.config/uzbl/config bak/
ln -s $PWD/.bashrc ~/.bashrc
ln -s $PWD/.inputrc ~/.inputrc
ln -s $PWD/.gitconfig ~/.gitconfig
ln -s $PWD/.zshrc ~/.zshrc
ln -S $PWD/.uzbl-config ~/.config/uzbl/config
source ~/.bashrc 

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]
then 
	ln -s $PWD/.tmux.conf-child ~/.tmux.conf
else
	ln -s $PWD/.tmux.conf-parent ~/.tmux.conf
fi

# Determine Linux version 
OS=$(lsb_release -si)
if [ $OS == "Ubuntu" ] || [ $OS == "Debian" ]
then 
	export INSTALL='sudo apt-get install' 
fi
if [ $OS == "Fedora" ] 
then 
	export INSTALL='sudo yum install' 
fi

# DOTFILES environment variable needed by .zshrc
export DOTFILES=$PWD

#Install Essential Packages
$INSTALL vim git zsh

chsh -s /bin/zsh

# Install Other Packages
$INSTALL markdown pandoc php-codesniffer 

# set up vim environment
mv ~/.vim bak/
mv ~/.vimrc bak/
ln -s $PWD/.vim ~/.vim
ln -s $PWD/.vimrc ~/.vimrc
$INSTALL vim


# get vundle and other submodules
git submodule update --init --recursive
vim -c PluginInstall

# todo.txt
#mv scripts/todo/todo.cfg bak/
#ln -s $PWD/todo.cfg scripts/todo/todo.cfg 
#chmod +x scripts/todo-plugins/.todo.actions.d/birdseye

# Check for GUI
if [[ $DISPLAY ]]
then
	mv ~/.vimperatorrc bak/
	mv ~/.pentadactylrc bak/
	mv ~/.gvimrc bak/
	mv ~/.i3/config bak/
	ln -s $PWD/.vimperatorrc ~/.vimperatorrc
	ln -s $PWD/.pentadactylrc ~/.pentadactylrc
	ln -s $PWD/.gvimrc ~/.gvimrc
	ln -s $PWD/.i3/config ~/.i3/config
	$INSTALL i3 kupfer vim-gnome ttf-anonymous-pro
fi 
#sudo apt-get install dwb
#ln -s $PWD/.dwb/* ~/.config/dwb/
