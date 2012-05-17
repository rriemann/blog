---
layout: post
title: Kubeplayer running on KDE Plasma Active powered ExoPC tablet
categories:
- kde
- ruby
comments: true
---

Hello Planet KDE, hello RubyCorner!

Much time has passed since i wrote my [previous blog post][announcement] about
Kubeplayer. Things doesn't change so much, but nowadays Kubeplayer is quite
stable and doesn't crash anymore. `;)`

After a lot of difficulties I got Kubeplayer packaged for opensuse. It's ready
to install with only [one click][oneclick] in the case you are using openSuSE
11.4—thanks to the open build service.

Before delivering any further details, you may want to see the video
demonstration on how Kubeplayer performs using [Meego][meego] and
[KDE Plasma Active][active].


{% youtube sOOTMVH-bjo %}

If you don't like [watching the video using Youtube][youtube], you can still
[uncollaps the webm video][collaps]{:#collaps-video} or download the [webm file][video]
directly.

<div id="video-view">
  <video controls="controls" autobuffer="false" preload="none" width="736" height="416">
    <source src="http://people.physik.hu-berlin.de/~rriemann/kubeplayer_plasma_active.webm" type="video/webm"/>
  </video>
</div>

## How To

If you want to turn your ExoPC into a Youtube-Player, too, here is the way to go:

- Install the [Meego image with Plasma Active][meegoimg]

That was the easy part. The rest is quite hard, due to the fact, that I didn't
found the ruby KDE language bindings. So maybe it is easier to use the [opensuse
based Plasma Active Installation][activeinstall].

- Try to compile smokegen, smokeqt, smokekde, qtruby and korundum

Because the KDE Plasma Active team doesn't seem to use KDE vanilla and there
might be some other reasons, too, it is quite hard to do that. I had to monkey
patch (commenting) a lot of files.

The installation of Kubeplayer is again quite simple, as you don't have to build
anything, but to meet the conventions, you can use `cmake` to copy the files to the
right place. By now, the [Kubeplayer repo][repo] is in playground.

~~~
git clone git://anongit.kde.org/kubeplayer
cd kubeplayer
git checkout -t -b tablet origin/tablet
cmake -DCMAKE_INSTALL_PREFIX=/usr
make # nothing happens
sudo make install
~~~

## Next Steps

There are plenty different tasks yet to do:

- Up to now there are no packages for any other distro than opensuse. It would
  be awesome if someone could help me to build packages for other distros (using
  the openbuild service), too.
- Do you have ideas which other video platforms could be added? I checked vimeo,
  but it seems to be complicated. I didn't found any other app doing something
  similar with youtube. Weird.
- Probably the interface could be made more touchfriendly by using some QML. I
  have absolutely no experience with that. Maybe someone can propose an idea how to
  make the list view be more slide friendly (flickable).
- To be able to deliver any ruby-KDE application to the not so experienced KDE
  hacker, it would be necessary to package the kdebindings for Meego.

So if you can help me, please get in contact!


[youtube]: http://www.youtube.com/watch?v=sOOTMVH-bjo "Kubeplayer video on Youtube"
[video]: http://people.physik.hu-berlin.de/~rriemann/kubeplayer_plasma_active.webm "Kubeplayer video webm version"
[announcement]: http://salout.github.com/blog/2010/12/18/announcing_kubeplayer.html "Announcement of Kubeplayer"
[oneclick]: http://software.opensuse.org/ymp/home:saLOUt:kubeplayer/openSUSE_11.4/kubeplayer.ymp?base=openSUSE%3A11.4&query=kubeplayer
[meego]: http://meego.org
[meegoimg]: http://share.basyskom.com/contour/Deployment/latest-meego-plasma-active-testing.html
[active]: http://community.kde.org/Plasma/Active
[activeinstall]: http://community.kde.org/Plasma/Active/Installation
[collaps]: #
[repo]: https://projects.kde.org/projects/playground/multimedia/kubeplayer/repository

<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
google.load("jquery", "1.7.3"); //load version 1.3.2 of jQuery
google.setOnLoadCallback(function() {
  jQuery(function($) {
    // run your jQuery code in here after DOM has loaded
    // Hide the "view" div.
    $('#video-view').hide();
    // Watch for clicks on the "slide" link.
    $('#collaps-video').click(function() {
      // When clicked, toggle the "view" div.
      $('#video-view').toggle();
      return false;
    });
  });
});
</script>