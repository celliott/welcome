# welcome

Simple dev workstation setup script. This script is designed to be run on a fresh Install of Yosemite.


###What it does:
- Installs:
  - [homebrew](http://brew.sh) and [caskroom](http://caskroom.io)
  - git
  - rbenv
  - pyenv
  - vagrant
  - boot2docker
  - iterm2
  - sublime text    
- Sets up the command line environment: 
  - Sets Sublime Text as default editor in the terminal for:
  
  	`.rb, .php, .yml, .xml, .txt, .sh, .json`
  - Installs ruby 2.2.2 and sets it as the system default
- Sets up the OS X environment:
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

# specify ruby version. default is 2.2.2
$ RUBY_VERSION=<x.x.x> ./setup.sh
```	

### Manual steps:


homebrew

```
==> This script will install:
/usr/local/bin/brew
/usr/local/Library/...
/usr/local/share/man/man1/brew.1

Press RETURN to continue or any other key to abort

```



```
WARNING: Improper use of the sudo command could lead to data loss
or the deletion of important system files. Please double-check your
typing when using sudo. Type "man sudo" for more information.

To proceed, enter your password, or type Ctrl-C to abort.

Password:
```

caskroom install

```
==> We need to make Caskroom for the first time at /opt/homebrew-cask/Caskroom
==> We'll set permissions properly so we won't need sudo in the future

Password:
```

Running again after a successful install will ask if you want to reinstall ruby

```
rbenv: /Users/<username>/.rbenv/versions/2.2.2 already exists
continue with installation? (y/N)
```


