#!/bin/python

import os
import sys
import logging
from sh import pacman, sed

HOST_NAME = "clyde"
USER_NAME = "tj"
USER_PASSWORD = "god"
USER_SSH_KEY = ""

def askUser():

    return False

def upgrade_system():
    logging.info("Upgrading System...")
    pacman("-Syy")
    pacman("-Su")

def install_essentials():
    logging.info("Installing Essentials")
    pacman("unzip", "wget", "vim", "less", "imagemagick", "sudo", "whois", "dnsutils", "-S")

def set_hostname(hostname):
    logging.info("Setting Hostname")

    for h in ['/etc/hostname', '/proc/sys/kernel/hostname']:
        os.remove(h)
        with open(h, 'w') as f:
            f.write(hostname)

    with open('/etc/hosts', 'a') as f:
        f.write("\n127.0.0.1 " + hostname)

class Security:

    def install_fail2ban():
        pacman("fail2ban", "-S")

    def install_ufw():
        pacman("ufw", "-S")

    def install_logcheck():
        pacman("logcheck", "logcheck_database", -S)

    def basic_ufw_setup():
        from sh import ufw
        ufw("logging", "on")
        ufw("default", "deny")
        ufw("allow", "ssh")
        ufw("allow", "http")
        ufw("allow", "https")
        ufw("enable")

    def sshd_edit_bool(param, state):
        if stat:

    def sshd_():
        sshd_edit_bool("", "")

    def sshd_():
        sshd_edit_bool("", "")

    def sshd_():
        sshd_edit_bool("", "")

    def sshd_():
        sshd_edit_bool("PasswordAuthentication", "")

