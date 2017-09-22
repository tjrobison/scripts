#! /bin/bash

REPOROOT="$HOME/src/thosefreshrepos"

DOTFILES="$REPOROOT/dotfiles"
VIMFILES="$REPOROOT/vimfiles"

cd $HOME/.config
mv awesome && ln -s $DOTFILES/awesome
ln -s $DOTFILES/openbox

ln -s $DOTFILES/autostart
ln -s $DOTFILES/Cope
ln -s $DOTFILES/dfc
ln -s $DOTFILES/htop
ln -s $DOTFILES/ipython
ln -s $DOTFILES/luakit
ln -s $DOTFILES/LS_COLORS
ln -s $DOTFILES/mutt
ln -s $DOTFILES/muttrc
ln -s $DOTFILES/ncmpcpp
ln -s $DOTFILES/newsbeuter
ln -s $DOTFILES/parcellite
ln -s $DOTFILES/pcmanfm
ln -s $DOTFILES/ranger
ln -s $DOTFILES/rtorrent.rc
ln -s $DOTFILES/Synergy
ln -s $DOTFILES/terminator
ln -s $DOTFILES/Thunar
ln -s $DOTFILES/tint2
ln -s $DOTFILES/ushare.conf
ln -s $DOTFILES/zsh

cd $HOME
ln -s $DOTFILES/colors .colors
ln -s $DOTFILES/couchpotato .couchpotato
ln -s $DOTFILES/fehbg .fehbg
ln -s $DOTFILES/hgrc .hgrc
ln -s $DOTFILES/mpd .mpd
ln -s $DOTFILES/mpdconf .mpdconf
ln -s $DOTFILES/mplayer .mplayer
ln -s $DOTFILES/pip .pip
ln -s $DOTFILES/rss .rss
ln -s $DOTFILES/ssh .ssh
ln -s $DOTFILES/tmux.conf .tmux.conf
ln -s $DOTFILES/urxvt .urxvt
ln -s $DOTFILES/wakeonlan .wakeonlan
ln -s $DOTFILES/weechat .weechat
ln -s $DOTFILES/wgetrc .wgetrc
ln -s $DOTFILES/wicd .wicd
ln -s $DOTFILES/xinitrc .xinitrc
ln -s $DOTFILES/Xdefaults .Xdefaults
ln -s $DOTFILES/zaliases .zaliases
ln -s $DOTFILES/zshrc .zshrc

ln -s $VIMFILES/spf13-vim-3 .spf13-vim-3
ln -s $VIMFILES/spf13-vim-3/.vim
ln -s $VIMFILES/spf13-vim-3/.vimrc
ln -s $VIMFILES/spf13-vim-3/.vimrc.bundles
ln -s $VIMFILES/spf13-vim-3/.vimrc.bundles.fork
ln -s $VIMFILES/spf13-vim-3/.vimrc.fork
ln -s $VIMFILES/.vimswap
ln -s $VIMFILES/.vimundo
ln -s $VIMFILES/.vimviews
ln -s $VIMFILES/vimrc.local .vimrc.local
