#!/bin/bash

case $1 in  
    autostart)  $EDITOR ~/.scripts/autostart ;;
    awesome)    $EDITOR ~/.config/awesome/rc.lua ;;
    awesomebig) $EDITOR ~/.config/awesome/rc_BIG.lua ;;
    awesomesmall) $EDITOR ~/.config/awesome/rc_SMALL.lua ;;
    boot)       sudo $EDITOR /boot/grub/grub.cfg ;;
    chat)       $EDITOR ~/.weechat/weechat.conf ;;
    colors)     $EDITOR ~/.colors/Terminal/colored ;;
    conky)      $EDITOR ~/.conkyrc ;;
    dns)        sudo $EDITOR /etc/pdnsd.conf ;;
    dns-tor)    sudo $EDITOR /etc/pdnsd-tor.conf ;;
    dropbox)    $EDITOR ~/.scripts/dropbox ;;
    dwm)        $EDITOR ~/.dwm/config.h ;;
    elinks)     $EDITOR ~/.elinks/elinks.conf ;;
    feed)       $EDITOR ~/.newsbeuter/config ;;
    feed-url)   $EDITOR ~/.newsbeuter/urls ;;
    fstab)      sudo $EDITOR /etc/fstab ;;
    grub)       sudo $EDITOR /etc/default/grub ;;
    hosts)      sudo $EDITOR /etc/hosts ;;
    init)       sudo $EDITOR /etc/mkinitcpio.conf ;;
    irc)        $EDITOR ~/.weechat/irc.conf ;;
    ls)         $EDITOR ~/.LS_COLORS ;;
    mail)       $EDITOR ~/.muttrc ;;
    most)       sudo $EDITOR /etc/most.conf ;;
    motion)     sudo $EDITOR ~/.motion/motion.conf ;;
    mpd)        sudo $EDITOR /etc/mpd.conf ;;
    mplayer)    sudo $EDITOR ~/.mplayer/config ;;
    music)      $EDITOR ~/.ncmpcpp/config ;;
    open)       $EDITOR ~/.local/share/applications/mimeapps.list ;;
    pacman)		sudo $EDITOR /etc/pacman.conf ;;
    pianobar)   sudo $EDITOR ~/.config/pianobar/config ;;
    polipo)     sudo $EDITOR /etc/polipo/config ;;
    powerdown)  sudo $EDITOR ~/.scripts/powerdown ;;
    powerup)    sudo $EDITOR ~/.scripts/powerup ;;
    psd)        sudo $EDITOR /etc/psd.conf ;;
    radeon)		sudo $EDITOR /etc/X11/xorg.conf.d/20-radeon.conf ;;
    restore)    $EDITOR ~/.scripts/restore ;;
    slim)       sudo $EDITOR /etc/slim.conf ;;
    ssh)        sudo $EDITOR /etc/ssh/ssh_config ;;
    sshd)       sudo $EDITOR /etc/ssh/sshd_config ;;
    symlinks)   $EDITOR ~/.scripts/symlinks ;;
    terminal)   $EDITOR ~/.Xdefaults ;;
    terminalbig) $EDITOR ~/.Xdefaults_BIG ;;
    terminalsmall) $EDITOR ~/.Xdefaults_SMALL ;;
    theme)      $EDITOR ~/.config/awesome/themes/colored/theme.lua ;;
    themebig)   $EDITOR ~/.config/awesome/themes/colored/theme_BIG.lua ;;
    themesmall) $EDITOR ~/.config/awesome/themes/colored/theme_SMALL.lua ;;
    tmux)       $EDITOR ~/.tmux.conf ;;
    tor)        sudo $EDITOR /etc/tor/torrc ;;
    torrent)    $EDITOR ~/.rtorrent.rc ;;
    vim)        $EDITOR ~/.vimrc ;;
    vim-color)  $EDITOR /usr/share/vim/vim73/colors/colored.vim ;;
    vimperator) $EDITOR ~/.vimperator/colors/awesome.vimp ;;
    wyrd)       $EDITOR ~/.wyrdrc ;;
    xinit)      $EDITOR ~/.xinitrc ;;
    xorg)		sudo $EDITOR /etc/X11/xorg.conf ;;
    zathura)    $EDITOR ~/.config/zathura/zathurarc ;;
    zsh)        $EDITOR ~/.zshrc ;;
    # Invalid
    *)          if [ -f "$1" ]; then
                    if [ -w "$1" ]; then
                        $EDITOR "$1"
                    else
                        sudo $EDITOR "$1"
                    fi
                else
                    echo "Invalid Option"
                    fi ;;
   esac
