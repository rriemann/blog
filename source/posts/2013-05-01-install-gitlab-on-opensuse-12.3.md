---
# kate: hl markdown;
 
title: "Install Gitlab on OpenSUSE 12.3"
date: 2013-05-01 22:59
comments: true
tags: [linux, opensuse, ruby]
---

* toc
{:toc}

### Private Git Repo Hosting

[Gitlab] brings the social coding [Github] experience to your own network. In
contrast to the commercial product Github which only allows to host open source
[git] repository projects using the free plan, you can install the free/libre software Gitlab
wherever you like and do what you want.
Therefore you need to setup a RubyOnRails environment.
Officially, Gitlab supports Debian/Ubuntu.
Read on how to install it on [OpenSUSE].

[Gitlab]: http://gitlab.org/
[Github]: http://www.github.com/
[OpenSUSE]: http://www.opensuse.org/
[git]: http://git-scm.com/

<!-- more -->

The presented solutions features a btrfs
filesystem RAID-1 `:)` and some custom patches. Instead of init.d startup scripts,
we use systemd. I recommend to use nginx as a webserver.

Please be aware that the development of Gitlab continues rapidly. This might break
this how-to at some point. Please read everything before starting!

### Install OS

* Download OpenSUSE 12.3 32bit, Network edition
  <http://download.opensuse.org/distribution/12.3/iso/openSUSE-12.3-NET-i586.iso>
* I chose 32bit, because Ruby Binary Extensions might have problems with lib64 path structure. We workaround this bug.
* I chose networkinstall, because we need only very few packages and don't need to download everything. only 200MB are downloaded during install
* the image can easily copied to a usb pen drive using the gui tool "imagewriter" (executed as root)
* Partition: There are 2 big hard drives. I created on both of them first a primary pratition of 1GB of type LINUX-RAID
* I use the yast software raid setup during the install to connect both partitions to a software raid-1 partititon of ext4 to mount in /boot
* I created on both hard drives a btrfs partition (50GB), but only mount the one on /dev/sda to /
* I created on both hard drives a swap space of 2 GB and mount both to swap

The system gets installed and the configuration follows.

* I open ssh. I disable ipv6.
* I disable dhcp and configure the hostname to "leise" and the site to our internet domain, the nameserver and the gateway is set to be the mail server.
* The server gets the fixed ip: 192.xxx.xxx.184
* The network check passes successfully and I apply immedately online updates.
* I leave the user input dialog blank and only set a root password

The installation is done. I test everything with a restart using `reboot`.
Now the root filesystem has to be turned to a btrfs raid system.

* I add a second device to the root file system: `btrfs device add /dev/sdb2 /`
* I convert the striped btrfs mode to the raid1 mode for filesystem data and metadata:
  `btrfs filesystem balance start -dconvert=raid1 -mconvert=raid1 /`

### Install Gitlab

* Homepage: <http://gitlab.org/>
* Source Code: <https://github.com/gitlabhq/gitlabhq>

The following steps apply to version 5.0 and try to copy the step by step
tutorial which is refered from the README:
<https://github.com/gitlabhq/gitlabhq/blob/master/doc/install/installation.md>

## Install dependencies:

    zypper ar http://download.opensuse.org/repositories/devel:/languages:/ruby:/extensions/openSUSE_12.3/devel:languages:ruby:extensions.repo

    zypper in patterns-openSUSE-devel_basis ca-certificates-cacert nginx rubygem-rb-inotify rubygem-ffi redis mysql-community-server mysql-community-server-client rubygem-bundler ruby19 ruby19-devel libmysqlclient-devel zlib-devel libyaml-devel libgdbm4 libreadline6 libncurses5 libffi47-devel curl git-core postfix checkinstall libxml2-devel libxslt-devel libcurl-devel libicu-devel
    # accept deinstallation of patterns-openSUSE-minimal_base-conflicts

    python2 --version # make sure to have version > 2.5 but < 3.0
    
    ruby1.9 --version # make sure to have a compatible version (in my case 1.9.3)
    cat /usr/bin/bundle # make sure to have ruby version 1.9 in the shebang line (first line in file)
    
    systemctl daemon-reload # reparse config for systemd (necessary, because we installed mysql)
    systemctl start mysql.service  # start mysql
    systemctl enable mysql.service # make mysql autostart
    cp /etc/redis/default.conf{.example,}
    chown redis.redis /etc/redis/default.conf
    systemctl enable redis.service
    systemctl start redis.service
    
#### Prepare system for Gitlab

* create a user git: `useradd -ms /bin/bash git`

#### Prapare Gitlab (using account git)

    su git # (change to the account of git)
    cd # (change to the home directory /home/git)
    git clone https://github.com/gitlabhq/gitlab-shell.git
    cd gitlab-shell
    cp config.yml.example config.yml
    vim config.yml # change domain to the domain of this computer
    cd
    ssh-keygen # to be sure, create ssh key (not mentioned in official docu) with empty passphrase
    
Follow the setup of the mysql data base: <https://github.com/gitlabhq/gitlabhq/blob/master/doc/install/databases.md#mysql>

  * `mysql -u root`
  * follow the guide for mysql commands

We continue with the setup of the GitLab Rails application:

    gem1.9 install charlock_holmes --version '0.6.9' # execute as root
    su git
    cd
    git clone https://github.com/gitlabhq/gitlabhq.git gitlab
    cd gitlab
    git checkout 5-0-stable # not possible yet, I use master instead
    vim config/gitlab.yml
    # ^- email_from: gitlab@atech.de, support_email: admin@atech.de, default_projects_limit: 100
    # disable username_changing_enabled
    chown -R git log/ tmp/
    chmod -R u+rwX log/ tmp/
    mkdir /home/git/gitlab-satellites
    mkdir tmp/pids/
    chmod -R u+rwX tmp/pids/
    cp config/unicorn.rb.example config/unicorn.rb
    cp config/database.yml.mysql config/database.yml
    vim config/database.yml # edit password and username
    bundle install --deployment --without development test postgres # takes a while
    bundle exec rake db:setup RAILS_ENV=production
    bundle exec rake db:seed_fu RAILS_ENV=production
    bundle exec rake gitlab:setup RAILS_ENV=production # chose yes
    bundle exec rake gitlab:shell:setup RAILS_ENV=production # chose yes
    git config --global user.name  "GitLab"
    git config --global user.email "gitlab@atech.de"
    
Install Check:

    su git
    cd /home/git/gitlab
    bundle exec rake gitlab:check RAILS_ENV=production
    
Go to yast firewall and open port http (and https port): 80, (443)

    # update services
    su
    cd /usr/lib/systemd/system/
    wget https://gist.github.com/veprbl/5115638/raw/9d18a341217f109accb67f57e8ad420c9de442fd/gitlab.service # TODO wrong mysqld
    wget https://gist.github.com/veprbl/5115638/raw/be78658953cd5967a4d874f5b0a019667cf090af/gitlab-worker.service # TODO same
    # double-check content of these files!
    chmod 644 gitlab.service gitlab-worker.service
    # TODO edit /etc/nginx/vhost.d/*
    systemctl daemon-reload