#!/usr/bin/env python2

import sys, os, glob, time
from socket import gethostname
from sh import tar, bz2

BASE_BACKUP_DIR = ""

CLEAR = "\033[1;0m"
FAIL = "\033[1;31m"
DONE = "\033[1;37m"

MSG_OK = DONE + "OK" + CLEAR
MSG_ERROR = FAIL + "ERROR" + CLEAR

class BackupBase(object):

    def __init__(self):

        self.local_host = gethostname()
        self.backup_dir = "/mnt/tyrese/archive/" + self.local_host
        self.num_backups = 7
        self.backup_suffix = ""#TODO im thinking it should be the date and/or time

        self.compress_cmd = sh.bzip2("-9")
        self.compress_ext = "bz2"

        self.backup_owner = "root:root"
        self.backup_perms_dir = 0700
        self.backup_perms_file = 0600

        self.users = ["root", "tj"]
        self.installed_pkgs = []
        self.additional_dirs = ["/etc", "/var/spool/cron"]

    def check_existence(self, path):
        d = os.path.isdir(path)
        f = os.path.isfile(path)
        if d or f:
            return True
        else:
            return False

    def save_pkg_list(self):
        print "Saving list of installed packages..."
        for pkg in shutil("pacman -Q --color never"):
            self.installed_pkgs.append(pkg)

    def get_home_path(self, user):
        userfile = open("/etc/passwd").readlines()
        for u in userfile:
            fields = u.split(":")
            if fields[0] == user:
                homedir = fields[6][:-1]
                break

        return homedir

    def check_home_dir(self, user):
        homedir = get_home_path(user)

        if isfile(homedir + "/.backup_list"):
            backup_list = open.(homedir + "/.backup_list")
        else
            print "Backup list not found. Exiting."
            sys.exit(1)

        print ">>> Checking " + user + "'s home:
        for item in backup_list:
            F = os.path.join(homedir, "item")
            if os.isfile(F) or os.isdir(F):
                print "EXISTS:  " + F
                existing = existing + homedir + "/" + F + " "
            else
                print "MISSING: " + F

        return existing

    def save_home_dir(self, user, backup_list=None):
        echo ">>> Saving " + user + "'s home..."
        if backup_list is not None:
            os.chdir("/")
            archive_path = self.backup_dir + "_localhost-user-" + user + ".tar.bz2"
            bz2( tar(backup_list, "c"), "-9", _out=archive_path )
        else:

    def save_additional_directories(self, dirs):
        for d in dirs:
            echo ">>> Saving " + d + "..."
            if os.isfile(d) or os.isdir(d):
                os.chdir("/")
                archive_path = self.backup_dir + d.replace("/", "_") + ".tar.bz2"
                bz2( tar(d, "c"), "-9", _out=archive_path )

    def save_commands_out(self, commands):
        for F in commands.keys():


    def cleanup_prev_backups(self, num_backups):
        print ">>> Cleaning up..."

    def ensure_permissions():
        for a in glob.glob(self.backup_dir):
            os.chown(a, "tj")
            os.chmod(a, 0600)


class LocalBackup(BackupBase):

    def __init__(self):


class RemoteBackup(BackupBase):

    def __init__(self, host):

        self.remote_host = host
        self.ssh_user= "root"
        self.ssh_key = "" #TODO path to private key file goes here



def main():
    if sys.argv[1] == "-c":
        print "List of missing files/dirs:"
        backup_list = open("/home/tj/.backup-list")
        for line in backup_list:
            path = os.path.join("/home/tj", line)
            if os.isdir(path) or os.isfile(path):
                print line
        print "End of List"
        sys.exit(0)
