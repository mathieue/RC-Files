# small Makefile to install dotfile in ~ and custom scripts in ~/bin
DOTFILES=mybashrc vimrc

all:

install:
	@mkdir -p ~/bin
	@cp bin/* ~/bin
	@for i in $(DOTFILES); do cp dotfiles/$$i ~/.$$i; done
	@cp -r dotfiles/vim ~/.vim

.PHONY: all install
