# raymond's VIM Environment Setting 

### Installation

* clone this repo
> git clone git://github.com/kangic/dot_vimrc.git<br/>
> ln -s ./dot_vimrc/vimrc ~/.vimrc<br/>

* clone 'vundle' repo
> git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

* install plugins in my vimrc(run vim)
> :BundleInstall


### after above things

* install global
> (sudo) apt-get install global

* copy a font file and set the font to terminal preference
> mkdir ~/.fonts<br/>
> cp ./fonts/VeraMono-Powerline.ttf ~/.fonts/.<br/>
> fc-cache -vf ~/.fonts

* vim-livedown plugin setting
> (sudo) apt-get install nodejs npm<br/>
> npm install -g livedown<br/>
> (sudo) ln -s /usr/bin/nodejs /usr/bin/node<br/>
> git clone git://github.com/shime/vim-livedown.git ~/.vim/bundle/vim-livedown

* vim-colors-solarized plugin setting
> cd ~/.vim/bundle<br/>
> git clone git://github.com/altercation/vim-colors-solarized.git

* vim-cpplint plugin setting
> cd ~/.vim/bundle
> git clone https://github.com/funorpain/vim-cpplint.git

### usage(update later)

* reload vimrc
  > so ~/.vimrc

* nerdtree
  * add bookmark to current dir
    > :Bookmark `alias` 
  * open a bookmarks
    > shift + 'b'
  * delete a bookmark
    > shift + 'd'
  * help
    > ?

* ctags usage
  * `ctags -R .` : make a tags file in command line
  * `ctrl + ']'`
  * `ctrl + 't'`
  * `:ts <tag_name> <RET>`


