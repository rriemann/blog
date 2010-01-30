---
layout: post
title: The perhaps smallest KDE application in the world
categories:
- ruby
- kde
---

For testing some parts of the korundum bindings, that allow the usage of KDE in Ruby, i wrote a small and lightweight application with only the necessary parts.

Maybe you can take it also to do some testings or just as a little example.

With its 12 lines (17 lines minus 3 empty lines minus Shebang line and $KCode line, that are not really required) of code it is perhaps the smalles KDE application you will find.

Of course, every Qt app would be a few lines smaller, because you dont need the KAbout object.


<div class="clearfix"></div>
{% highlight ruby %}
#!/usr/bin/env ruby

$KCODE = 'u'
require 'korundum4'

about = KDE::AboutData.new("ktest", "",
    KDE.ki18n("KTest"), "0.1")
KDE::CmdLineArgs.init(ARGV, about)
a = KDE::Application.new
w = KDE::PushButton.new( "Click me to quit" ) do
  connect( SIGNAL :clicked ) do
    puts "Do something else"
    KDE::Application.instance.quit
  end
end
w.show

a.exec
{% endhighlight %}