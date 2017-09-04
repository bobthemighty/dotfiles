#!/usr/bin/python
import re, subprocess
def get_pass(path=None):
    args = ["gpg", "--use-agent", "--quiet", "--batch", "-d", "/home/bob/.config/mutt/%s.gpg" % path]
    try:
        return subprocess.check_output(args).strip()
    except subprocess.CalledProcessError:
        return ""
