My .vim directory; configuration for the Vim text editor. 

Installation:
	
	Mac/Linux: git clone git://github.com/roryokane/dotvim.git ~/.vim
	Windows: git clone git://github.com/roryokane/dotvim.git %USERPROFILE%/.vim

Create symlinks:
	
	Mac/Linux:
	ln -s ~/.vim/vimrc ~/.vimrc
	ln -s ~/.vim/gvimrc ~/.gvimrc
	
	Windows:
	cd %USERPROFILE%
	mklink /H _vimrc .vim/vimrc
	mklink /H _gvimrc .vim/gvimrc

Switch to the `~/.vim` directory, and fetch submodules:
	
	Mac/Linux: cd ~/.vim
	Windows: cd %USERPROFILE%/.vim
	
	git submodule init
	git submodule update
