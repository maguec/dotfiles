#!/bin/bash

if [ ! -f ${HOME}/.dotfiles ] ; then
	echo "NO DOTFILES - checking out for you"
	cd ${HOME} && git checkout git@github.com:maguec/dotfiles.git .dotfiles
	cd ${HOME}/.dotfiles &&  git submodule update --init
fi

#setup vim
ln -s ${HOME}/.dotfiles/vim/vimrc ${HOME}/.vimrc
ln -s ${HOME}/.dotfiles/vim/gvimrc ${HOME}/.gvimrc
ln -s ${HOME}/.dotfiles/vim ${HOME}/.vim

#setup bash
ln -s ${HOME}/.dotfiles/bash/bashrc ${HOME}/.bashrc
ln -s ${HOME}/.dotfiles/bash/profile ${HOME}/.bash_profile

#setup mutt
ln -s ${HOME}/.dotfiles/mutt/mutt ${HOME}/.muttrc

