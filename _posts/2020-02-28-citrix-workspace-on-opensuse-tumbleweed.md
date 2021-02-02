---
layout: post
title: Citrix Workspace on openSUSE Tumbleweed
date: 2020-02-28 13:00
modified: 2021-02-02 17:35
comments: true
tags:
  - linux
  - tricks
published: true
categories: [digitalisation]
keywords:
  - Citrix Workspace
  - openSUSE Tumbleweed
  - installation
  - segmentation fault
  - segfault
---

**Please find a 2021 update below**

Some companies offer their employees to access their corporate computer work space remotely using a remote desktop connection. The company [Citrix](https://www.citrix.com/) provides software for such a connection. To connect, the employees need the software *Citrix Workspace* on their terminal devices. The company provides on their [download page](https://www.citrix.com/downloads/workspace-app/) also files for Linux including openSUSE. Unfortunately, their version 1912 from 12 December 2019 did not just work on my openSUSE Tumbleweed 64bit computer (and earlier versions I tried neither).

## Segmentation Fault and Missing Libraries

First, I tried to install the software package from the vendor.

1. I downloaded the *SuSE Full Package (Self-Service Support) Citrix Workspace app for Linux (x86_64)* in version 1912 from 12 December 2019.
2. `zypper in ICAClient-suse-19.12.0.19-0.x86_64.rpm`
3. I logged into a corporate page, open a connection configuration file (\*.ica) and nothing happened. So I assumed the application may have crashed. I downloaded the file and opened it in the terminal to see more.
4. `/usr/lib64/ICAClient/wfica -icaroot /opt/Citrix/ICAClient configuration-file.ica`
5. The app opened shortly and crashed then with the error message `segmentation fault (core dumped)`

Then, I tried to install somebody's own software package. Note that this requires trust or a review of the package.

1. I downloaded the [ICAClient](https://build.opensuse.org/package/show/home:enzokiel/ICAClient) from <https://download.opensuse.org/repositories/home:/enzokiel/openSUSE_15.2_Update/x86_64/> for openSUSE 15.2 Update x86_64 (hence, not Tumbleweed).
2. I installed the package despite the missing library `libcrypto.so.1.0.0`.
3. I found the missing library [openssl 1.0.0](https://software.opensuse.org/package/libopenssl1_0_0) and installed it.

Afterwards, the application did not segfault any longer. However, it produced an error due to a missing certificate from the *GlobalSign Root CA*.

1. So I went to Firefox, went to the *Privacy and Security* tab in the Preferences, and clicked on "View Certificates".
2. I exported the *GlobalSign Root CA* certificate to e.g. `/tmp`. There is more than one. Look for the one in the tree *GlobalSign nv-sa*.
3. Then, the certificate needs to be put into the certificate folder of Citrix Workspace. For the sofware package I use, this is `/usr/lib64/ICAClient/keystore/cacerts`. Navigate in the terminal to this folder and copy the certificate file in it. Then use `chown root:root [file.crt]` and `chmod 444 [file.crt]` to adapt file ownership and properties.

Afterwards, Citrix Workspace worked for me. If I have too much time, I will try to use the vendor package and see if I still get the segfault considering that I have now openssl 1.0.0 installed.

## Exchanging Data between Citrix Host and Citrix Client

There are two options to get data from your host OS to your Citrix client:

1. Clipboard: Copy'n'paste of text from the host to the client is suppoted on Linux. It did not work for me with files.
2. Mapping client devices: folders from the host can be mapped in the client as distinct drives. This is very useful to exchange files between host and client. To configure this option, launch from the startmenu  "Citrix Receiver (configmgr)". Alternatively, the tool can be launched from the command line with `/usr/lib64/ICAClient/util/configmgr -icaroot /usr/lib64/ICAClient`. In the tool, mappings are configured in the tab file access.

## Update 2021

At some point, the setup broke due to an expiring SSL certificate I believe. After some time trying, I ended up with the following easy setup:

1. deinstall the outdated version: `zypper rm ICAClient`
2. go to <https://www.citrix.com/downloads/workspace-app/linux/workspace-app-for-linux-latest.html> and downoad the rpm. In my case it was `ICAClient-suse-21.1.0.14-0.x86_64.rpm`
3. install the rpm with e.g. `zypper install [your folder]/ICAClient-suse-21.1.0.14-0.x86_64.rpm`
4. try to open a file. In my case, I got a "SSL error 61" (see [Citrix help](https://support.citrix.com/article/CTX231524))
5. I renamed the Citrix cacert storage: `mv /opt/Citrix/ICAClient/keystore/cacerts{,~}`
6. I linked in the system storage: `ln -sv /etc/ssl/certs /opt/Citrix/ICAClient/keystore/cacerts`

This did the trick!

## References

- <https://kenfallon.com/citrix-ssl-error-61-globalsign-root-ca/> with a tip on how to install the missing certificate
- <https://docs.citrix.com/en-us/receiver/windows/current-release/optimize/map-client-devices.html> with explanations on device mapping for Windows
