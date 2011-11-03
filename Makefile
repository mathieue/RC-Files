# small Makefile to install dotfile in ~ and custom scripts in ~/bin
all:
	git submodule init
	git submodule sync
	git submodule update
	cd dotfiles/.vim/bundle/command-t/ && rake make
	
install:
	mkdir -p ~/bin
	cp bin/* ~/bin
	[ -d ~/.vim ] || mkdir ~/.vim
	rm -rf ~/.vim/*
	[ -d ~/.bash ] || mkdir ~/.bash
	rm -rf ~/.bash/*
	cd dotfiles && tar cf - . | (cd ~; tar xfp -)
	[ -d ~/.vim/tmp ] || mkdir ~/.vim/tmp
	./bin/installrc.sh

.PHONY: all install
