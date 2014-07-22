dotvim
======

This repository contains a vim distribution created by and for Heath Farrow.

Installation
---------------------------
1. Install gvim or mvim (optional). Your vim build needs to support (lua, python, ruby, perl). Below are some examples of how vim should probably be configured
    
    Manual:
    ```
     ./configure --with-features=huge --enable-multibyte --enable-rubyinterp --enable-pythoninterp --enable-perlinterp --enable-luainterp --with-lua-prefix=/usr/local -with-luajit --enable-cscope
    ```
    Homebrew (OSX)
    ```
    brew install macvim --with-lua --with-luajit
    ```
2.  The recommended method is to add this repo as a git submodule.

    ```
    cd ~
    git clone --recursive git@github.com:hfarrow/dotconfig.git .dotconfig
    ```

3.  Use symbolic links for ~/.vim and ~/.vimrc. Remove or backup those files first if they exist already.

    ```
    cd ~
    mv .vim .vim.old
    mv .vimrc .vimrc.old
    ln -s .dotconfig/dotvim/ .vim
    ln -s .dotconfig/dotvim/configs/vimrc_template .vimrc
    ```
4. Install powerline fonts found in ~/.vim/dependencies/. DroidSansMono is the defualt used by hfvimrc.

5.  Run vim or gvim and you should be prompted to install the default plugins. You may have to press enter a few times
    during this process. You may see an error when initially starting vim but it is usually safe to ignore.
    The errors will not be seen when you run vim in the future

6.  After the plugins have installed restart vim or gvim. (Not required for some functionality)

7.  If you get errors about missing dependecies when installing then run the installation for those plugins manually
    to see what errors may have been encountered. For example, you must have a valid default compiler set in order
    to build YouCompleteMe.
    
    For linux:
    ```
    sudo apt-get install exuberent-ctags

    cd ~/.vim/bundle/vimproc
    make -f make_unix.mak
    
    cd ~/.vim/bundle/YouCompleteMe
    git submodule update --init --recursive
    ./install.sh --clang-completer
    
    cd ~/.vim/bundle/powerline
    ./setup.py build
    sudo ./setup.py install
    
    TODO: instructions for jshint
    ```

Configuration
---------------------------
* The base configuration is contained within hfvimrc. This file installs plugins and gives them a default
   configuration. hfvimrc also sets many vim settings and mappings which can be overridden in vimrc after hfvimrc has been sourced.

* Custom user configuration is made in vimrc after the line that sources gfvimrc. There are several global settings that
  can be used to control what plugins and plugin groups hfvim will load or exclude. Such settings must be set before
  hfvimrc is sourced.

* If a breaking change is introduced in hfvimrc, the major version will be incremented. The user vimrc must specify what
  major version it expects hfvimrc to be. An error will be thrown if the major versions do not match.
