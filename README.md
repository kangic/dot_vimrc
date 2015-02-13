# raymond's Vim Setting 

### Installation

* clone this repo
```
git clone git://github.com/kangic/dot_vimrc.git
ln -s ./dot_vimrc/vimrc ~/.vimrc
```

* clone 'vundle' repo
```
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

* install plugins in my vimrc(run vim)
```
:BundleInstall
```


### after above things
* install ctags and cscope
```
(sudo) apt-get install ctags cscope
```

* copy mkcscope.sh
```
(sudo) cp mkcscope.sh /usr/bin/.
```

* copy a font file and set the font to terminal preference
```
mkdir ~/.fonts
copy ./fonts/VeraMono-Powerline.ttf ~/.fonts/.
fc-cache -vf ~/.fonts
```

* vim-livedown plugin settings
```
(sudo) apt-get install nodejs npm
npm install -g livedown
(sudo) ln -s /usr/bin/nodejs /usr/bin/node
git clone git://github.com/shime/vim-livedown.git ~/.vim/bundle/vim-livedown
```

### usage(update later)
* ctags usage
  * make a tags file in command line
	> ctags -R .
  * ctrl + ']'
  * ctrl + 't'
	* :ts <tag> <RET>


