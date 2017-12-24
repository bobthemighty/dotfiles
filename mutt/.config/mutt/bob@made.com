set my_tmp=`gpg -o ~/.config/mutt/.tmp -d ~/.config/mutt/bob.gregory.gpg`
set my_gpass=`cat ~/.config/mutt/.tmp`
set imap_pass = $my_gpass
set smtp_pass = $my_gpass
set my_del=`rm -f ~/.config/mutt/.tmp`


set imap_user = "bob.gregory@made.com"
set from = "bob@made.com"
set realname = "Bob Gregory"
set hostname = made.com
set folder = "imaps://bob.gregory@made.com@imap.gmail.com:993"
set spoolfile = "+INBOX"
set postponed = "+[Gmail]/Drafts"
set record = "+[Gmail]/Sent Mail"
set smtp_url = "smtp://bob.gregory@made.com@smtp.gmail.com:587"
