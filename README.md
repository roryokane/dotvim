# Rory O’Kane’s personal Vim configuration

My `.vim` directory; configuration for the [Vim text editor](http://en.wikipedia.org/wiki/Vim_%28text_editor%29).

## Installation

### Download my config

#### On Mac/Linux:

	git clone git://github.com/roryokane/dotvim.git ~/.vim

#### On Windows:

	git clone git://github.com/roryokane/dotvim.git %USERPROFILE%/.vim

### Create symlinks

#### On Mac/Linux:

	ln -s ~/.vim/vimrc ~/.vimrc
	ln -s ~/.vim/gvimrc ~/.gvimrc

#### On Windows:

	cd %USERPROFILE%
	mklink /H _vimrc .vim/vimrc
	mklink /H _gvimrc .vim/gvimrc

### Download remote plugins

(For some reason, the Vundle-managed plugins don’t all have entries in Git’s `.gitmodules` file, meaning I can’t just tell Git to download all submodules. Here’s what worked for me instead.)

#### Install the [Vundle](https://github.com/gmarik/vundle) plugin manager

	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

#### Use Vundle to install plugins

	vim

In Vim:

	:BundleInstall

Ignore any errors from Syntastic after Vundle finished installing all of the plugins; just keep pressing ENTER until the errors are gone. Then quit Vim with `:q`.

When you launch `vim` again, Vim should now be all set up, and you should get no errors.
