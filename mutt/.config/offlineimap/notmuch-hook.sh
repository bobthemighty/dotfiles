#!/bin/sh
notmuch new
# retag all "new" messages "inbox" and "unread"
notmuch tag +inbox +unread -new -- tag:new
# github notifications skip the inbox
notmuch tag -inbox +github_notification -- from:notifications@github.com
# tag all messages from "me" as sent and remove tags inbox and unread
notmuch tag -new -inbox +sent -- from:bob@made.com or from:bob.gregory@made.com or from:bob@codefiend.co.uk or from:pathogenix@gmail.com and tag:new
# tag newsletters, but dont show them in inbox
notmuch tag +newsletters +unread -new -- from:newsletter@example.org or subject:'newsletter*'
#Rsyslog
notmuch tag +rsyslog +unread -new -inbox -- subject:'[rsyslog]*'
#Noise
notmuch tag -archive +noise +payment_failed --  subject:"Payment Transaction Failed"
#Accounts
notmuch tag +work -- to:made.com
notmuch tag +personal -- to:pathogenix@gmail.com or to:bob@codefiend.co.uk
