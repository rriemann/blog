---
layout: post
title: Announcing Kubeplayer (youtube w/o flash)
categories:
- kde
- ruby
---
* toc
{:toc}

# Hello Planet KDE, hello RubyCorner

Earlier this year I started writing a KDE application using
the Ruby programming language. Coming from the web development, I am no
expert at all in C++. So I decided to give KDE development a try using
the Ruby bindings for KDE 4 called [korundum4][rubykde].

It wasn't as easy as expected. Unfortunatly the korundum4 project didn't got
very popular by now, so I found a lot of bugs on the way. Now, three months
later, all the bugfixes are included in the last stable KDE. The idea, of
just copying the project folder and starting the app without the need of any
further setup[^1], becomes finally true.

[^1]: This isn't 100% true. You need to have korundum4 installed, but most distros
      seems to ship this package by default. On opensuse it is called "ruby-kde4".

# Announcing Kubeplayer

![Screenshot of Kubeplayer][img] I started a kind of clone of the well
known Qt-based Youtube player [Minitube][minitube]. When starting the development,
I had in mind to support Vimeo and maybe some other online video platforms, too.
The app should integrate itself better into the KDE workspace, and lately I had
the idea of turning it into a mobile app, too. It was possible to get a much
cleaner and shorter code, not only because of the nice KDE KIO classes,
but also by using Ruby.

# Let's Try It Out In Less Than 1 Minute!

Ok, to be fair, I have to admit, this is only possible using a recent
Linux OS[^2] with korundum4 and Ruby 1.9.x preinstalled.

[^2]: As KDE and Ruby is also available for many other OS, Kubeplayer is
      actually cross platform.

To give Kubeplayer a try, you just have to checkout the repository, and start
the application.

    git clone git://git.kde.org/kubeplayer
    ruby kubeplayer/kubeplayer

That's it. You can also install kubeplayer using CMake. Installation works like
you would it expect it from a CMake based C++ application.

If you get an error related to `json`, you are probably using an Ruby
version prior to 1.9.x. In this case you have to install rubygems via you distribution
package manager. Then you can use Ruby's own package manager to install the
missing dependency.

    gem install json

# Get Involved!

Not everything is done by now. Youtube works in <strike>the most</strike> a lot
of cases. The GUI needs a lot of small improvements. I even thought about a
maemo/meego port, paid for an N900 on
eBay, but unfortunately got duped `:(`. So the mobile development has to wait.

After all, the project is still quite young, the code is very short, nice and clear.
If you ever felt like trying to develop for/with KDE, the barrier is now quite low.

 - You don't have to deal with a KDE development environment. Just clone the repo
   and you are done. Since yesterday, you can find the project in [playground][project].<br/>
   `git clone git://git.kde.org/kubeplayer`
 - You don't need to know C++.
 - You don't have to compile anything at all!
 - You can use the shiny new git infrastructure of KDE.

Take a look at the code base. There are not many files at all. Summed up, there
are less then 1000 lines of code (including rare comments). For an already
functional multimedia application, this is really few.

    kubeplayer
    ├── CMakeLists.txt
    ├── kubeplayer
    ├── lib
    │   ├── CMakeLists.txt
    │   ├── kubeplayer.desktop
    │   ├── kubeplayer.rb
    │   ├── List.rb
    │   ├── MainWindow.rb
    │   ├── provider
    │   │   └── youtube
    │   │       └── Youtube.rb
    │   └── Video.rb
    ├── main.rb
    └── README.rdoc

How does the future of Kubeplayer look like? I have already a lof of ideas,
what could be done. Maybe you have also many, but different ones. What about:

 - allowing the use to login and comment on all supported video platforms
 - make flash needless on netbooks by providing an optimized app
 - create a scripted KPart to fetch youtube pages and open the video using kubeplayer
 - let the user download the videos (in a video library)
 - make it possible to share supported video platforms with the plasma media center team

So what do you think, can Kubeplayer do for you? What can you do for Kubeplayer?

Kind regards,<br/>
Robert

[img]:  {{ site.url }}/images/kubeplayer.png "Screenshot of Kubeplayer"
[project]: https://projects.kde.org/projects/playground/multimedia/kubeplayer "Official KDE Playground git repo"
[rubykde]: http://techbase.kde.org/Development/Languages/Ruby "KDE Development with Ruby"
[minitube]: http://flavio.tordini.org/minitube "Minitube project page"