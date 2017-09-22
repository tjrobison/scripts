#!/usr/bin/env python2
import sys, os, shutil
from socket import gethostname


dotfiles = [ "awesome", "blinky", "clyde",
            "cope", "couchpotato", "dotfiles.txt",
            "fehbg", "gtkpod", "hgrc",
            "htop", "install.py", "ipython",
            "irssi", "luakit", "mpdconf",
            "mutt", "ncmpcpp", "newsbeuter",
            "openbox", "parcellite", "pcmanfm",
            "ranger", "rss.conf", "rtorrent.rc",
            "setup.py", "slim.conf", "synergy.conf",
            "terminator", "tint2", "tmux.conf",
            "ushare.conf", "vim", "vimrc",
            "vimrc.bundles", "vimrc.local", "wakeonlan",
            "wgetrc", "xinitrc", "xmodmap",
            "xmodmap.modifiers", "Xresources", "zsh.d" ]

def parse_args():
    count = 0
    for arg in sys.argv:
        ++count
        if arg =="--src":
            source_dir = sys.argv[++count]
        if arg == "--dest":
            dest_dir = sys.argv[++count]
        if arg == "--debug":
            debug = True

def remove_dotfile(dotfile):
    path = dest_dir + '.' + dotfile
    if debug:
        print "Removing " + path + " ..."
    os.remove(path)

def copy_dotfile(dotfile):
    dest_path = dest_dir + '.' + dotfile
    if debug:
        print "Copying %s from %s to %s...", dotfile, source_dir, dest_dir
    shutil.copy((source_dir + dotfile), dest_path)
    return dest_path

def cleanse_mpd():
    os.remove("/var/lib/mpd")
    os.remove("/var/log/mpd")
    os.remove("/var/run/mpd")
    os.remove("/etc/mpd.conf")
    os.remove("/tmp/mpd.fifo")

    shutil.copy(mpd_dir + "playlists", "/var/lib/mpd/playlists")
    shutil.copy(mpd_dir + "mpd.db", "/var/lib/mpd/mpd.db")
    shutil.copy(mpd_dir + "mpdstate", "/var/lib/mpd/mpdstate")
    shutil.copy(mpd_dir + "mpd.log", "/var/log/mpd/mpd.log")
    shutil.copy(mpd_dir + "mpd.pid", "/var/run/mpd/mpd.pid")
    shutil.copy(mpd_dir + "mpd.conf", "/etc/mpd.conf")
    shutil.copy(mpd_dir + "mpd.fifo", "/tmp/mpd.fifo")

def main():
    debug = 0
    host = gethostname()
    source_dir = "/home/tj/.dotfiles/"
    dest_dir = "/home/tj/"

    parse_args()

    for f in dotfiles:
        remove_dotfile(f)
        new = copy_dotfile(f)
        os.chmod(new, 1363)

    cleanse_mpd()

if __name__ == "__main__":
    main()
