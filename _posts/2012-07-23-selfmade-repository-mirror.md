---
# kate: hl markdown;
title: "self-made router-powered repository mirror"
date: 2012-07-23 01:32
comments: true
tags: [kde, opensuse, linux]
lang: en
---

After migrating most desktop PCs at work, at home and of some friends to
[openSUSE][opensuse] with [upstream KDE repo][kde-repo], it was always a
time-consuming task to keep all these systems up-to-date. I was most
bothered by downloading the same files over and over again, which happened
sometimes to be quite slow, especially via WLAN.

Fortunatly I got a couple of month ago the Linux-based router [AVM Fritz!Box 7270][fritz],
which can be rooted with a modified firmware. The customizable firmware is
provided by the [Freetz][freetz] project and allows you to combine different
modular packages to add functionality.

<!--more-->

After playing a little bit with Freetz, I even got a lighttpd webserver with
ruby and caching capabilities running. Of course, the original firmware as well
as Freetz allow the configuration of dynamic DNS services. `;)`

I ended up with a configuration including:

- dropbear ssh server (allows remote login via ssh – otherwise only telnet is supported)
- automount-scripts supporting ext3 and ext4 (latter is not supported by AVM firmware)
- nfs including a CGI configuration web page
- rsync

I formatted an external hard drive to use ext4 and attached it to the router.
The file `mirror-rsync.sh` needs to be copied to an arbitrary folder on the
external drive.

<script src="https://gist.github.com/rriemann/1729496.js?file=mirror-rsync.sh"></script>

To lower the data transfer, I tuned my rsync commands to download only
x86_64 packages as well as only German language packages.

<script src="https://gist.github.com/rriemann/1729496.js?file=include.txt"></script>
<script src="https://gist.github.com/rriemann/1729496.js?file=exclude.txt"></script>

To finish the router setup, the only thing left is to add a Cron job (supported by
Freetz interface) which runs the script daily – preferably during the night.

The original firmware provides SMB access to files on the hard drive. This can be
quite slow. So I configured NFS for access these repositories. There's a
[German blog post][nfs-check] with some benchmarks to compare SMB and NFS.

Finally, the new repositories have to be activated. The priority is set to 90
and this way overranks the original repos, which don't have to be disabled.

<script src="https://gist.github.com/rriemann/1729496.js?file=client.sh"></script>

The most important thing is here to append `?mountoptions=vers=3` to all URLs.
The Freetz NFS build doesn't support NFS version 4 and zypper fails to auto-detect
this.

So the next time I want to bring the latest KDE release to a friend, I just have
to unplug my hard-drive and have everything with me. At work, I don't have to
bring my own hard drive with me – they have their own one `:p` with an equal script
which can be triggered from time to time.

[fritz]: http://en.wikipedia.org/wiki/FRITZ!Box
[opensuse]: http://www.opensuse.org/
[kde-repo]: http://en.opensuse.org/KDE_repositories#Upstream_release_aka._KR48_.28KDE_SC_4.8.29
[freetz]: http://freetz.org/
[nfs-check]: http://linuxundich.de/de/hardware/dateifreigaben-auf-der-fritzbox-via-nfs-und-freetz/