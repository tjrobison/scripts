#!/usr/bin/python2

import socket

s = socket.Socket()
host = socket.gethostname()
port = 12345

s.bind(host, port)  # bind to the port
s.listen(5)         # wait for connection

while True:
    c, addr = s.accept()
    print 'Conn to', addr
    c.send("Whaddup Brah..")
    c.close()
