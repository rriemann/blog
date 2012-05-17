---
layout: post
title: Simple Ruby Plasmoid
categories:
- kde
- ruby
---
* toc
{:toc}

# Hello Planet KDE, hello RubyCorner

After some blog posts on my old blog about KDE programming with Ruby
I decided to bring the content a little bit more to the people. Here I am.

Two days before yesterday I got a mail concerning a problem related to creating
plasmoids with Ruby. I never had the wish to create my own plasmoid. I thought
it would be difficult, but while getting a closer look, I've noticed how easy it
is - in the case of using Ruby.

# Simple Ruby Plasmoid

![Simple Plasmoid made with Ruby][img]{:.right}
This example is a modified version from the one in the [KDE techbase wiki][0].

The plasmoid sends the content of a *QLineEdit* to the clipboard when pressing the
*QPushButton* or pressing the enter key and clears the *QLineEdit* afterwards.

## Test It

If you want to try it yourself, you just have to extract
[simple\_ruby\_plasmoid\_clipboard.tar.gz][file], change the directory to
*ruby-test-applet* and start the plasmoid in a special viewer with
`plasmoidviewer`.

You have to install the Ruby KDE bindings package (on opensuse it is called
ruby-kde4), but on a lot of KDE4 systems this should be installed already.

## Understand It

First you need the right directory tree for your plasmoid. It should be look
like this:

    ruby-test-applet/
    |-- contents
    |   `-- code
    |       `-- main.rb
    `-- metadata.desktop

You need at least two files. The first one is *main.rb*, that contains your
program code.

When accessing KDE libs from Ruby you write nearly the same code
as you would write in C++.

A short example in C++:

{% highlight c %}
setMinimumSize( 150, 150 )
Plasma::LineEdit line_edit( parent )
{% endhighlight %}

The same using Ruby:

{% highlight ruby %}
set_minimum_size 150, 150
# or
setMinimumSize 150, 150
# or
self.minimum_size = 150, 150
line_edit Plasma::LineEdit.new self
{% endhighlight %}

Member variables begins with an @ sign. There are different aliases for KDE and
Qt methods. You can omit brackets in a lot of cases. You don't need any header
files. You don't need to compile.

{% highlight ruby %}
require 'plasma_applet'

module RubyTestApplet
  class Main < PlasmaScripting::Applet

    slots :addText

    def init
      set_minimum_size 150, 150

      @layout = Qt::GraphicsLinearLayout.new Qt::Vertical, self
      self.layout = @layout

      @label = Plasma::Label.new self
      @label.text = 'This plasmoid will copy the text you enter below to the clipboard.'
      @layout.add_item @label

      @line_edit = Plasma::LineEdit.new self

      begin
        @line_edit.clear_button_shown = true # not supported in early plasma versions
      rescue
        nil # but that doesn't matter
      end

      @layout.add_item @line_edit

      @button = Plasma::PushButton.new self
      @button.text = 'Copy to clipboard'
      @layout.add_item @button

      Qt::Object.connect( @button, SIGNAL(:clicked), self, SLOT(:addText) )
      Qt::Object.connect( @line_edit, SIGNAL(:returnPressed), self, SLOT(:addText) )
    end

    def addText
      Qt::Application.clipboard.text = @line_edit.text
      @line_edit.text = ""
    end

  end
end

# kate: remove_trailing_space on; replace-trailing-space-save on; indent-width 2; indent-mode ruby;
{% endhighlight %}

The second file you need is the *metadata.desktop* containing all the meta data. `;)`

{% highlight ini %}
[Desktop Entry]
Name=Simple Ruby applet
Comment=This is a simple applet written in Ruby
Icon=chronometer
Type=Service
ServiceTypes=Plasma/Applet

X-Plasma-API=ruby-script
X-Plasma-MainScript=code/main.rb

X-KDE-PluginInfo-Author=Me
X-KDE-PluginInfo-Email=me@example.com
X-KDE-PluginInfo-Name=ruby-test
X-KDE-PluginInfo-Version=0.1
X-KDE-PluginInfo-Website=http://plasma.kde.org/
X-KDE-PluginInfo-Category=Examples
X-KDE-PluginInfo-Depends=
X-KDE-PluginInfo-License=GPL
X-KDE-PluginInfo-EnabledByDefault=true
{% endhighlight %}

What do you think? So easy, isn't it? If you have ever played a little
bit with Ruby and Qt or KDE you should know enough to create your own plasmoid
within a quarter of an hour!




[img]: {{ site.url }}/images/simple_ruby_plasmoid_clipboard.png "Simple Plasmoid made with Ruby"
[file]: {{ site.url }}/files/simple_ruby_plasmoid_clipboard.tar.gz
[0]:   http://techbase.kde.org/Development/Tutorials/Plasma/Ruby/SimplePasteApplet "Tutorial on KDE Techbase Wiki"