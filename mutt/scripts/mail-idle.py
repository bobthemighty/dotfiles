#!/bin/python
import imaplib
import select
import sys

class mysock:
    def __init__(self, name, server, user, passwd, directory):
        self.name = name
        self.directory = directory
        self.M = imaplib.IMAP4_SSL(host=server)
        self.M.login(user, passwd)
        self.M.select(self.directory)
        self.M.send(bytes("%s IDLE\r\n"%(self.M._new_tag()), 'utf-8'))
        r = self.M.readline()
        if not r.startswith(bytes('+','utf-8')): # expect continuation response
            exit(1)

    def fileno(self):
        return self.M.socket().fileno()

if __name__ == '__main__':
    hasmail = False
    while not hasmail:
        sockets = [
                mysock("made", "imap.gmail.com", "bob.gregory@made.com", "zbsxvyelcidqzbua", "[Gmail]/All Mail"),
                mysock("made", "imap.gmail.com", "bob.gregory@made.com", "zbsxvyelcidqzbua", "INBOX"),
                ]
        readable, _, _ = select.select(sockets, [], [], 1980) # 33 mins timeout

        if not readable:
            print("TIMEOUT")
            exit(0)

        for sock in readable:
            r = sock.M.readline()
            print(r, file=sys.stderr)
            if r.find(bytes('EXISTS', 'utf-8')) != -1:
                print("%s,%s" % (sock.directory, sock.name))
                hasmail = True
                break
