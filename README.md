dotvim
======

This repository contains a vim distrobution created by and for Heath Farrow.

Installation
---------------------------
1.  The recommended method is to add this repo as a git submodule.
        mkdir ~/.dotvim/
        cd ~/.dotvim
        git init
        git submodule add git@github.com:hfarrow/dotvim.git

2.  Use symbolic links for ~/.vim and ~/.vimrc. Remove or backup those files first if they exist already.
        cd ~
        mv .vim .vim.old
        mv .vimrc .vimrc.old
        ln -s .dotvim/ .vim
        ln -s .dotvim/vimrc .vimrc

3.  Run vim or gvim and you should be prompted to install the default plugins. You may have to press enter a few times
    during this process. You may say an error when initially starting vim but usually it is safe to ignore. The ignores
    will not be seen when you run vim in the future

4.  After the plugins have installed restart vim or gvim. (Not required for some functionality)

Configuration
---------------------------
* The base configuration is contained with in hfvimrc. This file installs plugins and gives them a default
   configuration. hfvimrc also sets many vim settings and mappings which can be overriden in vimrc after hfvimrc has
   been sourced.

* Custom user configuration is made in vimrc after the line that sources gfvimrc. There are several global settings that
  can be used to control what plugins and plugin groups hfvim will load or exclude. Such settings must be set before
  hfvimrc is sourced.

* If a breaking change is introduced in hfvimrc, the major version will be incremented. The user vimrc must specify what
  major version it expects hfvimrc to be. An error will be thrown if the major versions do not match.
