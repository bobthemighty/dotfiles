set my_tmp=`gpg -o ~/.config/mutt/.tmp -d ~/.config/mutt/pathogenix.gpg`
set my_gpass=`cat ~/.config/mutt/.tmp`
set imap_pass = $my_gpass
set smtp_pass = $my_gpass
set my_del=`rm -f ~/.config/mutt/.tmp`


set imap_user = "pathogenix@gmail.com"
set from = "pathogenix@gmail.com"
set realname = "Bob Gregory"
set hostname = made.com
set folder = "imaps://pathogenix@imap.gmail.com:993"
set spoolfile = "+INBOX"
set postponed = "+[Gmail]/Drafts"
set record = "+[Gmail]/Sent Mail"
set smtp_url = "smtp://pathogenix@smtp.gmail.com:587"
