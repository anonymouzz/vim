## Description

## Minimal VIM configuration file based on KISS principle

![vim screen](https://raw.github.com/aliev/vim/master/screen.png "Vim screen")

## How to install?

```
cd ~
git clone https://github.com/aliev/vim.git
mv ~/vim ~/.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "source ~/.vim/vimrc" > .vimrc
vim +BundleInstall +qall # Install all plugins

# Syntax check for python users
sudo pip install pylama

# Syntax check for javascript users
sudo npm install -g jslint

# Tern library for javascript
cd ~/.vim/bundle/tern_for_vim/
sudo npm install tern
```

# Installing YouCompleteMe

```
cd ~/.vim/bundle/YouCompleteMe/
./install.sh
```

## For Mac users

You must install newtest macvim using brew (please, install XCode first):

```
brew install macvim --override-system-vim
```

This command will replace old system vim

## Important

If jedi-vim autocomplete doesn't work correctly, you must upgrade you vim to latest version (currently 7.4), or disable ```g:airline#extensions#tabline#enabled``` option

## More goodies for console users

### My .psqlrc config file

[Here](https://gist.github.com/aliev/a25f0e8cf88fc02ef516)

### Powerline for tmux

https://github.com/erikw/tmux-powerline

if you use tmux, possible for you will use the following configuration

```
# don't wait for an escape sequence after hitting
# Esc. fixes insert mode exit lag in vim
set -sg escape-time 0
set -g terminal-overrides 'xterm*:smcup@:rmcup@'

set-option -g default-terminal "screen-256color"
# ---------------------
# Enable mouse
# ---------------------
set -g mode-mouse on
set -g mouse-resize-pane on
set -g mouse-select-pane on
set -g mouse-select-window on

# No delay for escape key press
set -sg escape-time 0

set-window-option -g mode-keys vi
bind-key -t vi-copy 'v' begin-selection
bind-key -t vi-copy 'y' copy-selection
```

If you want to enable powerline for your tmux, you can use [this installation instruction](http://powerline.readthedocs.org/en/latest/installation.html)

For example, i've installed my powerline by using command like this:

```
sudo pip install powerline
```

After installation i've added similar lines in my .tmux.conf (for os x only):

```
source /Library/Python/2.7/site-packages/Powerline-beta-py2.7.egg/powerline/bindings/tmux/powerline.conf
```

It seems all is well until it comes to using iTerm2 on OSX. Suddenly scrolling
back in the outer terminal shows history from prior to the start of tmux. There
are no end of suggestions about how to fix this, including "disable the status bar"
and "it should just work". Actually it’s fairly simple.

Enable the option under "Preferences -> Profiles -> Terminal" called
``` Save lines to scrollback when an app status bar is present ```

taken from here http://dan.carley.co/blog/2013/01/11/tmux-scrollback-with-iterm2/

Enable clipboard between the Mac OS and tmux: https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard

### CtrlP Note

To work correctly CtrlPBufTag you must install exuberant ctags.

For MacOS X Users:

```
brew install ctags
```

For Ubuntu Users:

```
sudo apt-get install exuberant-ctags
```

### Patched Menlo fonts for powerline you can get here

https://github.com/abertsch/Menlo-for-Powerline

### Prezto (awesome zsh configuration)

https://github.com/sorin-ionescu/prezto


### Oh-my-zsh (my favorite configuration)

Note: If tmux will not recognize the fonts, uncomment the following line to the file. zshrc

```
# You may need to manually set your language environment
export LANG=en_EN.UTF-8
```

To console has become even more beautiful, you can use the following extensions

Zsh substring search
https://github.com/zsh-users/zsh-history-substring-search

Zsh asutosuggestions
https://github.com/tarruda/zsh-autosuggestions

Zsh syntax highlighting
https://github.com/zsh-users/zsh-syntax-highlighting

An example of how I connected the extensions

```
# Must be enabled before zsh-autosuggestions!
source ~/zsh-history-substring-search/zsh-history-substring-search.zsh

# Setup zsh-autosuggestions
source ~/.zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init

source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

### Vim indent line

https://github.com/Yggdroot/indentLine

Note, option:

```
let g:indentLine_faster=1
```

will speed up the indentLine

### Vim GoCode (like jedi-vim for golang)

https://github.com/Blackrush/vim-gocode

### Tern based JavaScript editing

https://github.com/marijnh/tern_for_vim

### Multilanguage syntax checking

https://github.com/scrooloose/syntastic
