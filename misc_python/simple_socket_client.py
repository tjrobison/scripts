#!/usr/bin/python2

import socket

s = socket.Socket()
host = socket.gethostname()
port = 12345

s.connect(host, port)
print s.recv(1024)
s.close
