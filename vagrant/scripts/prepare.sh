#!/usr/bin/env bash

APP_DIRECTORY='/srv/app-dev'
APTITUDE_FLAGS='--no-gui -y'
CURRENT_USER=$USER
FISH_SHELL_CONFIG_DIR="$HOME/.config/fish"
FISH_SHELL_FUNCTIONS_CONFIG_DIR="$FISH_SHELL_CONFIG_DIR/functions"

# Get new/upgradable packages.
sudo aptitude $APTITUDE_FLAGS update

# We'll most likely need this later.
sudo aptitude $APTITUDE_FLAGS install build-essential

# Install NFS for the synced folders.
sudo aptitude $APTITUDE_FLAGS install \
  nfs-common \
  nfs-kernel-server \
  portmap \

# Get the "python-software-properties" package for the "apt-add-repository" command.
sudo aptitude $APTITUDE_FLAGS install python-software-properties

# Install "mosh" and "fish" shell.
sudo apt-add-repository -y 'ppa:fish-shell/release-2'
sudo apt-add-repository -y 'ppa:keithw/mosh'
sudo aptitude $APTITUDE_FLAGS update
sudo aptitude $APTITUDE_FLAGS install \
  fish \
  mosh \

sudo aptitude $APTITUDE_FLAGS install \
  curl \
  tree \
  vim \
  wget \
  unzip \

# Set up some default settings for "fish" shell.
mkdir -p $FISH_SHELL_CONFIG_DIR
cd $FISH_SHELL_CONFIG_DIR
cp "/vagrant/templates$FISH_SHELL_CONFIG_DIR/config.fish" ./
cd -

# Set up a prompt for "fish" shell.
mkdir -p $FISH_SHELL_FUNCTIONS_CONFIG_DIR
cd $FISH_SHELL_FUNCTIONS_CONFIG_DIR
cp "/vagrant/templates$FISH_SHELL_FUNCTIONS_CONFIG_DIR/fish_prompt.fish" ./
cd -

# Set "fish" shell as the default shell.
sudo chsh -s $(which fish) $CURRENT_USER

mkdir -p $APP_DIRECTORY

# Get new/upgradable packages and do a "safe" upgrade.
sudo aptitude $APTITUDE_FLAGS update
sudo aptitude $APTITUDE_FLAGS safe-upgrade
sudo aptitude $APTITUDE_FLAGS autoclean
