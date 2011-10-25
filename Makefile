# small Makefile to install dotfile in ~ and custom scripts in ~/bin
all:
	git submodule init
	git submodule update
	cd dotfiles/vim/bundle/command-t/ && rake make
	
install:
	mkdir -p ~/bin
	cp bin/* ~/bin
	cp melie-tools/melie-* ~/bin
	[ -d ~/.vim ] || mkdir ~/.vim
	rm -rf ~/.vim/*
	[ -d ~/.bash ] || mkdir ~/.bash
	rm -rf ~/.bash/*
	cd dotfiles && cp -av . ~/
	[ -d ~/.vim/tmp ] || mkdir ~/.vim/tmp
	./bin/installrc.sh

.PHONY: all install
