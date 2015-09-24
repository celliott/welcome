#!/bin/bash

# dev workstation setup script
# docs: https://github.com/celliott/welcome

set -e

RUBY_VERSION=2.2.2
SUBLIME_CONTENT_TYPES=("public.ruby-script" "public.php-script" "org.yaml.yaml" "public.xml" "public.plain-text" "public.shell-script" "public.json")

echo "[info] welcome..."

if xcode-select -p > /dev/null;
then
	echo "[info] xcode installed"
else
	echo "[error] you must install xcode before running!"
	echo "[info] run $ xcode-select --install"
	exit
fi


# installing homebrew...
if which brew > /dev/null;
then
	echo "[info] homebrew installed"
else
	echo "[info] installing homebrew"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi


echo "[info] installing dev dependencies..."
brew install git
brew update
brew install caskroom/cask/brew-cask rbenv pyenv
brew link autoconf pkg-config
brew cask install virtualbox vagrant boot2docker iterm2 
brew tap caskroom/versions
brew cask install sublime-text3


# update .bash_profile
echo 'export PATH=/bin:/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$HOME/.rbenv/bin:$PATH
export EDITOR="subl -w"
export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"
export PYENV_ROOT=/usr/local/var/pyenv
eval "$(pyenv init -)"' >> ~/.bash_profile


# set sublime the default text editor
# NOTE need to test
for CONTENT_TYPE in "${SUBLIME_CONTENT_TYPES[@]}"
do
	defaults write com.apple.LaunchServices LSHandlers -array-add "{ LSHandlerContentType = $CONTENT_TYPE; LSHandlerRoleAll = 'com.sublimetext.3'; }"
done


# disable smart quotes and dashes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false


# install ruby
echo "[warning] installing ruby. we all know this takes too long"
export PATH="$HOME/.rbenv/bin:/usr/local/bin:$PATH"
eval "$(rbenv init -)"
echo $(rbenv install $RUBY_VERSION)
rbenv rehash
rbenv global $RUBY_VERSION


# results
echo "[info] ---	#results"
echo "[notice] restart/logout to remove smart quotes and setup sublime cli"
echo "[info] $(ruby -v)"
echo "[info] $(git --version)"
echo "[info] $(boot2docker version)"
echo "[info] $(subl -v)"
echo "[info] $(vagrant -v)"
echo "[info] command to open files in sublime: $ open ruby.rb"
echo "[info] done"
