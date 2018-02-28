---
# kate: hl markdown;
title: "Automatically Login to wifi.free.fr Wifi"
date: 2013-10-09 00:46
comments: true
tags: [linux, tricks]
---

The not so expansive French mobile phone operator [free.fr](http://www.free.fr) offers
some nice extras for their clients. People can use the free.fr hotspots, which
you can find at many places in French cities. Unfortunately you have to login
manually using the gateway page <https://wifi.free.fr/> for every wifi reconnect.
Ähm – do you really have to? `;)`

<!-- more -->


I'm one of these lucky guys who can actually receive this hotspot in the own flat.
So why should I pay extra for cable internet?

To still have some selling points for ADSL customers free.fr doesn't make it very
convenient to use this free wifi. The network comes without any security modes like 
WPA/WPA2/WAP, but requires you to authenticate yourself an a gateway page every time
you reconnect to the network. There is only one other option which incorporates SIM card
authentication which is not an option for most computers due to the lack of a SIM card.

So why not using `curl` to send automatically an POST request with your login data
as soon as you got connected to the so-called "FreeWifi" network?

Using openSuSE 12.3 or any other Linux distribution based on NetworkManager you
just place the following file `freewifi-up` in `/etc/NetworkManager/dispatcher.d`.

~~~bash
#! /bin/sh
#
# auto login freewifi from free.fr
#
#
. /etc/rc.status

case "$2" in
    up)
        if iwgetid | grep -qs :\"FreeWifi\"; then
                curl -s --retry 10 --retry-max-time 0 -X POST -d 'login=000000000&password=mypassword&submit=Valider' https://wifi.free.fr/Auth > /dev/null
        fi
        ;;
    *)
        exit 0
        ;;
esac
~~~
*/etc/NetworkManager/dispatcher.d/freewifi-up*
{: .code-meta}

The actual name of the file is not very important. But pay attention to set the
appropiate file rights `chmod 755 freewifi-up`. Of course, you have to replace
the login number and the password by your own.

The script will be run by networkmanager automatically when the connection status
get changed. Only if a connection was setup the wifi SSID will be checked to be
`FreeWifi`. Only In this case an authentication request will be send to the gateway webpage.