# Rory O’Kane’s personal Vim configuration

My `.vim` directory; configuration for the Vim text editor. 

## Installation

### Download

Mac/Linux: `git clone git://github.com/roryokane/dotvim.git ~/.vim`
Windows: `git clone git://github.com/roryokane/dotvim.git %USERPROFILE%/.vim`

### Create symlinks

#### Mac/Linux:

	ln -s ~/.vim/vimrc ~/.vimrc
	ln -s ~/.vim/gvimrc ~/.gvimrc

#### Windows:

	cd %USERPROFILE%
	mklink /H _vimrc .vim/vimrc
	mklink /H _gvimrc .vim/gvimrc

### Download remote plugins

(For some reason, the Vundle-managed plugins don’t all have entries in Git’s `.gitmodules` file, meaning you can’t just tell Git to download all submodules. Here’s what worked for me instead.)

#### Install Vundle plugin manager

	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

#### Use Vundle to install plugins

	vim

	(in Vim)
	:BundleInstall

Ignore any errors from Syntastic after installing; just keep pressing ENTER until the errors are gone, and then quit Vim with `:q`. When you launch `vim` again, it should now be all set up.
