#!/bin/sh
notmuch new
# retag all "new" messages "inbox" and "unread"
notmuch tag +inbox +unread -new -- tag:new
# github notifications skip the inbox
notmuch tag -inbox +github_notification -- tag:inbox and from:notifications@github.com
notmuch tag +todo -- tag:github_notification and to:review_requested@noreply.github.com
notmuch tag +todo -- tag:inbox and from:peoplehremail.com and "Holiday Request"
# tag all messages from "me" as sent and remove tags inbox and unread
notmuch tag -new -inbox +sent -unread -- from:bob@made.com or from:bob.gregory@made.com or from:bob@codefiend.co.uk or from:pathogenix@gmail.com and tag:new
# tag newsletters, but dont show them in inbox
notmuch tag +newsletters +unread -new -- tag:inbox and from:newsletter@example.org or subject:'newsletter*'
#Rsyslog
notmuch tag +rsyslog +unread -new -inbox -- tag:inbox and subject:'[rsyslog]*'
#Noise
notmuch tag -archive +noise +payment_failed -inbox --  tag:inbox and subject:"Payment Transaction Failed"
notmuch tag -archive +noise +payment_failed -inbox --  to:f166bb-pay@made.com
notmuch tag -archive +noise -inbox --  from:support@pcapredict.com
notmuch tag -archive +noise +sitemap_failed -inbox --  tag:inbox and subject:"Sitemap generate Warnings"
notmuch tag -archive +noise +payment_failed -inbox --  tag:inbox and from:"no-reply@rentabiliweb.com"
#Accounts
notmuch tag +work -- tag:inbox and to:made.com
notmuch tag +personal -- tag:inbox and to:pathogenix@gmail.com or to:bob@codefiend.co.uk

# Alerts
notmuch tag +pingdom +alert -inbox -- tag:inbox and from:alert@pingdom.com
notmuch tag +pingdom -inbox -- tag:inbox and from:no-reply@pingdom.com
notmuch tag +pagerduty +alert -- tag:inbox and from:no-reply@pagerduty.com
notmuch tag +riemann +alert -inbox -- tag:inbox and from:riemann@made.com
notmuch tag +pcapredict +alert -inbox -- tag:inbox and from support@pcapredict.com
notmuch tag +be2bill +alert -inbox -- tag:inbox and from support@be2bill.com
notmuch tag +adyen +alert -inbox -- tag:inbox and from do-not-reply@adyen.com

# Reports
notmuch tag +report -inbox -- tag:inbox and from:noreply@newrelic.com and "performance report"
notmuch tag +report -inbox -- tag:inbox and from:feedback@slack.com
notmuch tag +report -- tag:inbox and from:peoplehremail.com and "Weekly Recap"

notmuch tag +family +school -inbox -- from:warwick.surrey.sch.uk and tag:inbox
notmuch tag +report -- from:Pingdom subject:"Daily Report"

# AWS
notmuch tag +aws -inbox -- tag:inbox and from:made.com and from:"Amazon Web Services"

#Cert
notmuch tag +cert -inbox +newsletter -- tag:inbox and from:ncas.us-cert.gov

# Calendar
notmuch tag +cal -- tag:inbox and mimetype:text/calendar or mimetype:application/ics
notmuch tag +cal -inbox -- tag:inbox and from:getsolid.io

# Announcements
notmuch tag +announce -inbox -- "[Housekeeping Updates]" or "[Company Announcements]" or "[New Starters, Promotions & Leavers]"
notmuch tag +fbwork -inbox -- tag:inbox and from:fbworkmail.com
notmuch tag +meetup -inbox -- tag:inbox and from:info@meetup.com
notmuch tag +meetup -inbox -- tag:inbox and from:Gartner.Events@gartner.com
notmuch tag +meetup -inbox -- tag:inbox and from:community@skillsmatter.com
