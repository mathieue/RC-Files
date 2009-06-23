# small Makefile to install dotfile in ~ and custom scripts in ~/bin
DOTFILES=mybashrc vimrc inputrc

all:

install:
	@mkdir -p ~/bin
	@cp bin/* ~/bin
	@for i in $(DOTFILES); do cp dotfiles/$$i ~/.$$i; done
	@[ -d ~/.vim ] || mkdir ~/.vim
	@rm -rf ~/.vim/*
	@cp -r dotfiles/vim/* ~/.vim/
	@[ -d ~/.vim/tmp ] || mkdir ~/.vim/tmp

.PHONY: all install
