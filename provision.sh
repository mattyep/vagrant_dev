#!/bin/bash

apt-get update -y

apt-get install -y -q wget curl tmux vim git zsh libssl-dev libffi-dev zlib1g-dev

su -c "git clone https://github.com/gmarik/Vundle.vim.git /home/vagrant/.vim/bundle/Vundle.vim" vagrant
su -c "git clone https://github.com/mattyep/dotfiles.git /home/vagrant/dotfiles" vagrant
su -c "git clone https://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh" vagrant

rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
      --exclude "README.md" --exclude "LICENSE-MIT.txt" -avh --no-perms /home/vagrant/dotfiles/ /home/vagrant/
sudo chsh -s $(which zsh) vagrant

if [ ! -d /usr/local/rbenv ]
  then
    # Install rbenv
    su -c "git clone git://github.com/sstephenson/rbenv.git ~/.rbenv" vagrant
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/vagrant/.zshrc
    echo 'eval "$(rbenv init -)"' >> /home/vagrant/.zshrc  
  fi

# Install ruby-build:
pushd /tmp
	git clone git://github.com/sstephenson/ruby-build.git
	cd ruby-build
	./install.sh
popd