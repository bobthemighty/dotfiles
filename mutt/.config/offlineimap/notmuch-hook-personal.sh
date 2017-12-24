#!/bin/sh
notmuch new
# retag all "new" messages "inbox" and "unread"
notmuch tag +inbox +unread -- tag:new
# github notifications skip the inbox
notmuch tag -inbox +github_notification -- tag:new and from:notifications@github.com
# tag all messages from "me" as sent and remove tags inbox and unread
notmuch tag -new -inbox +sent -- tag:new and from:bob@codefiend.co.uk or from:pathogenix@gmail.com and tag:new
# tag newsletters, but dont show them in inbox
notmuch tag +newsletters -inbox -- tag:new and from:bill@sinocism.com or from:skeptoid.com or from:m@ttias.be or electoral-reform.org or from:MartinsMoneyTips@moneysavingexpert.com or from:team@kaggle.com or from:digest-noreply@quora.com

notmuch tag +newsletter +go -- tag:new and from:discourse@forums.online-go.com or from:news@gogameguru.com
notmuch tag +newsletters +commercial -inbox -- tag:new and from:influxdata.com
notmuch tag +newsletter +commercial -inbox -unread -- from:imperialcandles@gmail.com
notmuch tag +newsletter +commercial -- from:bbc@bbc.co.uk
notmuch tag +newsletter +commercial -- from:contact@mailer.humblebundle.com
notmuch tag +newsletter +commercial -- from:team@hired.com
notmuch tag +newsletter +commercial -- from:editor@toptal.com

# social
notmuch tag +social -inbox -unread -- tag:new and from:messages-noreply@linkedin.com or from:noreply@youtube.com or from:notifications-noreply@linkedin.com

# To-do
notmuch tag +todo -- tag:new and from:redhill.library@surreycc.gov.uk

#Accounts
notmuch tag +personal -- tag:new and to:pathogenix@gmail.com or to:bob@codefiend.co.uk

#Jobs
notmuch tag +career -inbox -- tag:new and from:do-not-reply@stackoverflow.email or from:jobs-listings@linkedin.com
notmuch tag +career -inbox -unread -- tag:new and functionalworks.com


# Receipts
notmuch tag +payments -inbox -- tag:new and from:googleplay-noreply@google.com
notmuch tag +payments -inbox -- tag:new and from:service@paypal.co.uk

# School
notmuch tag +family +wraycommon -- tag:new and from:wray-common@scopay.com


notmuch tag -new -- tag:new
