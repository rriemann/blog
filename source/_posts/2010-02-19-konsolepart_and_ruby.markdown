---
layout: post
title: Add a full-featured shell to your GUI (with Ruby)
categories:
- kde
- ruby
---
* toc
{:toc}

# KonsolePart

![GUI integrating KDE libkonsolepart][img]{:.right}
To get a shell in your GUI, you don't have to reinvent the wheel - just use
the KonsolePart provided by KDE KParts. If you use the [KDE][kde] environment
you already know the libkonsolepart, because Dolphin, Konqueror, Kate, Yakuake,
etc. take usage of it.

To get this small demo run, you need a KDE version already containing SVN
commit 1085699 (ttanks no Arno, who made the Part accessable within ruby).
The opensuse buildservice should provide a package `ruby-kde4` in Factory Repo,
but I build I didn't test it.

Just copy both files in the same directory, make the main.rb executable and run it.

The example contains a little bit more than neccessary, because it implements
a fully customizable menus/toolbars via KXmlWindow and shows how to use
actions and slots.

To get only the KonsolePart widget, you only have to look at the KonsolePart
class. The class itself bases on a short code example from Arno. Kudos to him!

For further explanation just take a look
at the source code.

# Usage

You can change the working directory for the built-in shell
by a nice dialog and can execute some command by the lineedit. To send your command
to the shell, you have to press enter.

I know there are a lot of bugs. `;)` But it is just a quick and dirty demo.

# main.rb

{% highlight ruby %}
#!/usr/bin/env ruby

$KCODE = 'u'

require 'korundum4'

class KonsolePart

  def initialize parent

    factory = KDE::PluginLoader.new("libkonsolepart").factory
    @part = factory.create("KParts::ReadOnlyPart", parent, nil, [], "")

    @terminal = @part.qobject_cast(KDE::TerminalInterfaceV2)

    if @terminal.nil?
      @terminal = @part.qobject_cast(KDE::TerminalInterface)
    end
    pwd

  end

  public

  def widget
    @part.widget
  end

  # http://api.kde.org/4.3-api/kdebase-apps-apidocs/konsole/html/Part_8h_source.html
  def pwd path = '.'
    @terminal.show_shell_in_dir path
  end

  def cmd input
    @terminal.send_input input
  end

end

class CustomWidget < KDE::XmlGuiWindow

  slots :changedir, :docmd

  def initialize( parent = nil )

    super

    resize( 800, 600 )

    ##### Prepare Central Widget
    @centralwidget = Qt::Widget.new self
    setCentralWidget @centralwidget

    #### Build window layout
    @centralWidgetVLayout = Qt::VBoxLayout.new @centralwidget

    @kPBtnChangePwd = KDE::PushButton.new @centralwidget
    @kPBtnChangePwd.connect( :clicked, self, :changedir)
    @centralWidgetVLayout.addWidget @kPBtnChangePwd
    @kLineEdt = KDE::LineEdit.new @centralwidget
    @kLineEdt.connect( :returnPressed, self, :docmd )
    @centralWidgetVLayout.addWidget @kLineEdt
    @centralWidgetVLayout.add_stretch

    ##### Build Konsole Panel
    @konsoleDockWidget = Qt::DockWidget.new self
    @konsoleDockWidget.objectName = "konsoleDockWidget"
    @konsoleDockWidget.features = Qt::DockWidget::AllDockWidgetFeatures
    @mykonsole = KonsolePart.new @konsoleDockWidget
    @konsoleDockWidget.setWidget @mykonsole.widget
    addDockWidget Qt::BottomDockWidgetArea, @konsoleDockWidget

    ##### Prepare actions
    @closeAction = KDE::StandardAction::quit( self, SLOT( :close ), actionCollection )
    actionCollection.addAction "toggle_konsole", @konsoleDockWidget.toggleViewAction

    ##### Prepare GUI
    setupGUI( Default, File.dirname( File.expand_path( __FILE__ ) ) + "/ui.rc" )
    retranslate_ui

  end

  def changedir
    folder = %x{ kdialog --getexistingdirectory . }
    @mykonsole.cmd "cd #{folder}" unless folder.nil?
  end

  def docmd
    @mykonsole.cmd "#{@kLineEdt.text}\n"
    @kLineEdt.text = ""
  end

  def retranslate_ui
    setWindowTitle i18n "KPlaylistTool"
    @konsoleDockWidget.setWindowTitle i18n "Konsole"
    @kPBtnChangePwd.setText i18n "Change Directory"
  end
end

about = KDE::AboutData.new("konsoleinruby", "konqueror", KDE.ki18n("Konsole in Ruby"), "0.1", KDE::ki18n("A short description"), KDE::AboutData::License_GPL_V3, KDE::ki18n("© 2010 Robert Riemann"), KDE::ki18n("See kde-apps.org for Updates"), "http://homepage.de", "bugs@homepage.de" )
about.setProgramIconName  "plasma"
KDE::CmdLineArgs.init(ARGV, about)
a = KDE::Application.new
w = CustomWidget.new
w.show
a.exec
{% endhighlight %}


# ui.xml

{% highlight xml %}
<?xml version="1.0" encoding="UTF-8"?>
<gui name="konsole_in_ruby">
     version="1"
     xmlns="http://www.kde.org/standards/kxmlgui/1.0"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.kde.org/standards/kxmlgui/1.0
                         http://www.kde.org/standards/kxmlgui/1.0/kxmlgui.xsd" >
  <MenuBar>
    <Menu name="file" >
    </Menu>
    <Menu name="view" >
      <Action name="toggle_konsole" />
    </Menu>
  </MenuBar>
  <ToolBar name="mainToolBar" >
    <text>Main Toolbar</text>
    <Action name="toggle_konsole" />
    <Action name="file_quit" />
  </ToolBar>
</gui>
{% endhighlight %}


[kde]: http://kde.org/
[img]: {{ site.url }}/images/konsolepart_ruby_demo.png "GUI integrating KonsolePart"