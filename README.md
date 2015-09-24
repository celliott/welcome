# welcome

Simple dev workstation setup script. This script is designed to be run on a fresh Install of Yosemite.


###What it does:
- Manage development dependencies using [homebrew](http://brew.sh) and [caskroom](http://caskroom.io)
  - git
  - rbenv
  - pyenv
  - vagrant
  - boot2docker
  - iterm2
  - sublime text
- Sets up the command line environment
  - Sets Sublime Text as default editor in the terminal
  - Installs ruby 2.2.2 and sets it as the system default
- Sets up the OS X environment
  - disable smart quotes and smart dashses

### Dependencies:
- Xcode command line tools

```
# follow directions to instal xcode cli
$ xcode-select --install
```  
  
### Run script:
  
```
# download setup.sh
$ curl https://raw.githubusercontent.com/celliott/welcome/master/setup.sh >> setup.sh
	
# set setup.sh as executable	
$ chmod +x setup.sh
	
# run setup.sh
$ ./setup.sh
```	