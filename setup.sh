#!/bin/bash

for i in .vim .vimrc .gvimrc .bashrc .bash_profile .muttrc; do

	if [ -f ${HOME}/${i} ] ; then
		echo "moving ${HOME}/${i} to ${HOME}/${i}.bkup"
		mv ${HOME}/${i} ${HOME}/${i}.bkup
	fi
done

if [ ! -d ${HOME}/.dotfiles ] ; then
	echo "NO DOTFILES - checking out for you"
	cd ${HOME} && git checkout git@github.com:maguec/dotfiles.git .dotfiles
fi

#setup vim
ln -s ${HOME}/.dotfiles/vim/vimrc ${HOME}/.vimrc
ln -s ${HOME}/.dotfiles/vim/gvimrc ${HOME}/.gvimrc
ln -s ${HOME}/.dotfiles/vim ${HOME}/.vim
ln -s ${HOME}/.dotfiles/vim ${HOME}/.neovimrc

#setup bash
ln -s ${HOME}/.dotfiles/bash/bashrc ${HOME}/.bashrc
ln -s ${HOME}/.dotfiles/bash/profile ${HOME}/.bash_profile

#setup mutt
ln -s ${HOME}/.dotfiles/mutt/mutt ${HOME}/.muttrc

#setup tmux
ln -s ${HOME}/.dotfiles/tmux/conf ${HOME}/.tmux.conf
ln -s ${HOME}/.dotfiles/tmux/teamocil ${HOME}/.teamocil

#setup ctags
ln -s ${HOME}/.dotfiles/vim/ctags ${HOME}/.ctags

if [ ! -d ${HOME}/.vim/bundle/vundle ]; then
	echo "Installing vundle"
	cd ${HOME} &&git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

# L9 is borked on the old version of Centos and that's
# the only version of redhat I run anywhere
if [ -f /etc/redhat-release ] ; then
	rm -rf ${HOME}/.dotfiles/vim/bundle/FuzzyFinder
	rm -rf ${HOME}/.dotfiles/vim/bundle/L9
fi
