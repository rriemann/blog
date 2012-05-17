---
layout: post
title: Using GPG-Agent with opensuse 11.3 and zsh
categories:
- linux
- opensuse
- gpg
---

[![GnuPG Logo][img]{:.right}][gpg]
I'm a supporter of mail encryption since I started using free software.
At least, I sign all my own mails, with the exception of mails to people,
who don't know what an \*.asc file is and might not open my mail for this reason.

By the way, my public gpg key fingerprint is:

    F6A9 332D AA28 625E 59A8 F758 7BF6 0F4A 861B C3A3

I'm also involved in the [CAcert][cacert] project. If
you want to get "assurced", don't hesitate to contact me,
if you are in Berlin.

There is just one problem. If you want to sign all your
mails, you have to type your hopefully long passphrase
at least once[^1] for every single mail. If you get some
encrypted mails from your friends, you have to type your
passphrase for viewing mails, too. That's not so nice.
So were the gpg-agent invented, which task is to cache
your passphrase for a given time, but it didn't work for
me - until today.

I followed the tutorial from the [opensuse SDB][suse] with
no success. Please note, that you might need to change the
`pinetry-qt` to `pinetry-qt4`.

**The solution**, which **works for me**, was to copy the mentioned
line to `~/.zprofile` instead of `.xinitrc`, as I am using the
awesome [zsh][zsh].

[suse]: http://tr.opensuse.org/SDB:Using_gpg-agent "SDB opensuse on gpg-agent"
[cacert]: http://www.cacert.org/ "CAcert"
[zsh]: http://www.zsh.org/ "Zsh"
[img]: http://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Gnupg_logo.svg/200px-Gnupg_logo.svg.png
[gpg]: http://www.gnupg.org/ "Gnu GPG"
