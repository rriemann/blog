---
layout: post
title: Ruby Qt/KDE4 Template KMainWindow
categories:
- ruby
- kde
---

![KMainWindow]({{ site.url }}/images/kmainwindow.png "KMainWindow"){:.right}

Starting using the Qt-Toolkit (or the extension with KDE classes) is a little difficult. Especially if you never used really the toolkit with C++. So you have to learn translating the C++ API reference into ruby.

Some usefull links:
- [Ruby Techbase on kde.org](http://techbase.kde.org/Development/Languages/Ruby)
- [Qt API Reference](http://doc.qtsoftware.com/)
- [KDE API Reference](http://api.kde.org/)

But when you got it, the usage is pretty cool. In the following code listing you can find the code for a full-featured kmainwindow.

<div class="clearfix"></div>
{% highlight ruby %}
#!/usr/bin/env ruby
# file: kmainwindow.rb
$KCODE = 'u'

require 'korundum4' # kd4 bindings

class CustomWidget < KDE::MainWindow

  def initialize

    super

    resize(520, 535)

    # Prepare the Actions
    @actionQuit = KDE::Action.new( self ) {
      setIcon KDE::Icon.new "application-exit"
    }
    connect( @actionQuit, SIGNAL( :triggered ), SLOT( :close ) )

    # Prepare the Menu
    @menuBar = menuBar
    @menuFile = Qt::Menu.new @menuBar
    @menuFile.addAction @actionQuit
    @menuBar.addAction @menuFile.menuAction
    @helpMenu = helpMenu
    @menuBar.addAction @helpMenu.menuAction

    setMenuBar(@menuBar)

    # Prepare Statusbar
    @statusBar = statusBar
    setStatusBar @statusBar

    # Prepare Toolbar
    @toolBar = toolBar
    @toolBar.addAction @actionQuit
    addToolBar(Qt::TopToolBarArea, @toolBar)


    # Prepare Central Widget
    @centralwidget = KDE::TextEdit.new self
    setCentralWidget @centralwidget

    retranslateUi
  end

  def retranslateUi
    @menuFile.title = i18n "File"
    setWindowTitle i18n "MainWindow"
    # @statusBar.showMessage i18n "Loading"
    @actionQuit.text = i18n "Quit"
    @actionQuit.shortcut =  KDE::Shortcut.new i18nc( "Quit", "Ctrl+Q" )
end

end

about = KDE::AboutData.new(
  "app",                           # internal application name
  # language catlog name for i10n (konqueror's catalog for the beginning is better than no catalog)
  "konqueror",
  KDE.ki18n("KApp"),                 # application name in the about menu and everywhere else
  "0.1",                             # application version
  KDE::ki18n("A Tool to easily create HTML formatted Code"),  # short description
  KDE::AboutData::License_GPL_V3,    # license
  KDE::ki18n("(c) 1999-2000, Name"), # copyright info
  # text in the about box - maybe with \n line breaks
  KDE::ki18n("just some text in the about box"),
  # project homepage and eMail adress for bug reports - attention: homepage changes standard dbus/dcop name!
  "http://homepage.de", "bugs@homepage.de" )

about.setProgramIconName  "plasma" # use the plasma-icon instead of question mark
KDE::CmdLineArgs.init(ARGV, about)
a = KDE::Application.new
w = CustomWidget.new
a.topWidget = w
w.show
a.exec
{% endhighlight %}