---
layout: post
title: Does owncloud really requires a server-side backend?
categories:
- kde
- gnome
---

Hi planetkde, hi readers from planet gnome (so called aliens[^1]),

I've just stumbled upon a [blog post][collaborate_post] dealing with a potential
collaboration of KDE and gnome to initiate a replacement for dropbox, called
[ownCloud][owncloud].

There are already thoughts about possible GSoC projects giving attention to the
gnome/KDE frontend clients and to the **server backend**.

Nice idea, but in my humble opinion there is a problem, at least for me:
I haven't a hosted root server, but a lot of unix accounts with user webspace,
where it is impossible to run any kind of background services/daemons.

Think of:
- university accounts
- (scientific) institute accounts
- accounts from your IT related work

Think of people, who probably uses linux.

In the case that ownCloud is meant to be *the* center of all data synchronisations,
it would be sad that those people who *only* have webspace cannot take advantage of it.

So I encourage the developer to design the ownCloud in a way that makes the 
server-side backend software only optional, but not a requirement.

This would be similar to git, which can use a server side backend (git://), but
is also satisfied with a simple sftp connection (ssh://).
(Please correct me if I am wrong.)

After all you might want to read an [article][saas] about the disadvantages of
SaaS published by <http://www.gnu.org>. Exaggerated message in one sentence: Don't get dependant of other
people server services. `;)`


[owncloud]: http://owncloud.org "official ownCloud homepage/wiki"
[collaborate_post]: http://www.webupd8.org/2010/03/gnome-and-kde-might-collaborate-into.html "Gnome And KDE Might Collaborate Into Creating A FLOSS Alternative To Dropbox"
[saas]: http://www.gnu.org/philosophy/who-does-that-server-really-serve.html "How Software as a Service Takes Away Your Freedom"

[^1]: Just a joke. Don't take it serious.