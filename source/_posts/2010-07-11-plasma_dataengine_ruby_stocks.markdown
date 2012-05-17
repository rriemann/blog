---
layout: post
title: Making Of ruby-stocks Plasma DataEngine
categories:
- kde
- ruby
---
* toc
{:toc}

# Hello Planet KDE, hello RubyCorner

Since I wrote my last Blog post much time has past. After my last exam last
Friday I just started to do some hacking on KDE. As it should be something simple
for the beginning and something useful, too, I decided to provide a new plasma
dataengine for retrieving stocks information.

I used ruby, because plasma hacking with ruby is freaking awesome and totally
easy. Let's prove it!

# How To Use It

![Simple Plasmoid made with Ruby][img]{:.right} Before diving into the
development process, you probably want to test the final result yourself.
First you have to [download][file] the plasma package. Then you can install
it easily with the plasma package manager.

    plasmapkg -t dataengine -i plasma-dataengine-ruby-stocks-v1.0.zip

You won't need to be root for that. You should get a success response afterwards.

As there is by now no plasmoid to display the provided data, you have to use
the `plasmaengineexplorer` to test the engine. Call this program on your shell
and look for ruby-stocks. You have to type in a stocks symbol like GOOG (Google)
or NOK (Nokia) to get the information. Is is also possible to just call:

    plasmaengineexplorer --engine ruby-stocks --source NOK

You can remove the engine with this short command:

    plasmapkg -t dataengine -r ruby-stocks

# How To Create It

I started with a look on [the plasma ruby examples][1] and copied the inital
construct from the given time data engine example. There was also an attempt to
create a stocks engine with C++. The code is available in the [playground][0].

The most time took the clean implementation of the cvs data parsing.

If you want to start yourself with a ruby based dataengine, I recommend to start
with the time engine example, too. Do not change the given file structure,
which should be:

    plasma-dataengine-ruby-stocks
    ├── contents
    │   └── code
    │       ├── main.rb
    │       └── …
    └── metadata.desktop

The top directory gets packaged into a zip for distribution.

Let's take a look on the *main.rb*. There a some important things you have to be
aware of, when you want to use ruby for plasma dataengines:

- when you name your engine "ruby-stocks" (see metadata.desktop), you have to
  name the top module RubyStocks. Otherwise your engine will fail.
- Plasma looks for a class called Main in that module, which have to inherit
  from PlasmaScripting::DataEngine
- make sure, that you implement the member methods:
  sourceRequestEvent and updateSourceEvent

As both methods should do the same in my example, I used an method alias.
If you ever did a plasma dataengine using C++ you have noticed, that it is a
straight forward port from C++ to ruby. There is hardly something different.

{% highlight ruby %}
# kate: remove-trailing-space on; replace-trailing-space-save on; indent-width 2; indent-mode ruby; syntax ruby; replace-tabs on; replace-tabs-save on; space-indent on;
require 'plasma_applet'

# the dictonary replaces the ruby hash as we need an ordered hash. only ruby 1.9 uses ordered one.
# when ruby1.9 is the default version, we can switch back to native ruby hash
require 'dictionary'

module RubyStocks
  class Main < PlasmaScripting::DataEngine

    # the url needs to be extended by the stock ID at the end of the string
    # format code: http://brusdeylins.info/projects/yahoo-finance-api/
    DATA = Dictionary[
      "j1" => ["market capitalization", Float],
      "p2" => ["percent change", String],
      "s0" => ["symbol",String],
      "d1" => ["last trade date", Qt::Date],
      "t1" => ["last trade time", Qt::Time],
      "c1" => ["change", Float],
      "o0" => ["open", Float],
      "h0" => ["days high", Float],
      "g0" => ["days low", Float],
      "v0" => ["volume", Float],
      "a2" => ["average daily volume", Float],
      "l1" => ["last trade", Float],
      "c4" => ["currency", String]
    ]

    SOURCE_URL = "http://download.finance.yahoo.com/d/quotes.csv?f=#{DATA.keys.join}&e=.csv&s="

    def initialize parent, args = nil
      super parent

      # don't update faster than once a minute
      setMinimumPollingInterval 60000
      # dafault update rate is 10 minutes
      setPollingInterval 600000

    end

    def updateSourceEvent source
      request_url = SOURCE_URL + Qt::Url::toPercentEncoding(source).data.strip
      job = KIO::storedGet KDE::Url.new(request_url), KIO::NoReload, KIO::HideProgressInfo
      job.connect( SIGNAL( 'result( KJob* )' ) ) do |aJob|
        parseCSVLine source, aJob.data
      end

      return false
    end

    def parseCSVLine source, dataByteArray
      $stderr.puts "ruby-stocks plasma dataengine: retrieved data: " + dataByteArray.data
      dataArray = dataByteArray.data.strip.split ","
      if dataArray.size >= DATA.size
        DATA.values.each do |aValue|
          data =  dataArray.shift
          unless data =~ %r{N/A}
            if aValue[1] == Float
                data.gsub! /B$/, "E6"
                data.gsub! /M$/, "E3"
                setData source, aValue[0], data.to_f unless data == "N/A"
            elsif aValue[1] == String
              data = data[1..-2]
              setData source, aValue[0], data unless data.empty?
            elsif aValue[1] == Qt::Time
              setData source, aValue[0], Qt::Time.fromString(data, '"h:mmap"')
            elsif aValue[1] == Qt::Date
              setData source, aValue[0], Qt::Date.fromString(data, '"M/d/yyyy"')
            end
          end
        end
      end
    end

    alias sourceRequestEvent updateSourceEvent

  end

end
{% endhighlight %}


The second file you need is the *metadata.desktop*.

{% highlight ini %}
[Desktop Entry]
Name=Stocks Data Engine
Comment=Stocks Data Engine powered by Yahoo! Finance (real time delayed by around 15 minutes

Type=Service
ServiceTypes=Plasma/DataEngine
X-Plasma-API=ruby-script
X-Plasma-MainScript=code/main.rb

X-KDE-PluginInfo-Author=Robert Riemann
X-KDE-PluginInfo-Email=saloution@googlemail.com
X-KDE-PluginInfo-Name=ruby-stocks
X-KDE-PluginInfo-Version=1.0
X-KDE-PluginInfo-Website=http://plasma.kde.org/
X-KDE-PluginInfo-Category=Online Services
X-KDE-PluginInfo-Depends=
X-KDE-PluginInfo-License=GPL
X-KDE-PluginInfo-EnabledByDefault=true

# Icon=alarmclock
{% endhighlight %}

# What Comes Next?

[![Simple Plasmoid made with Ruby][2]{:.left style="width:256px;height:178px;"}][2]The
engine should be quite usable by now. I plan to create a plasmoid which
lets you search for a company name to get the stocks symbol and then shows
some important numbers (like the weather widget, but without these nice graphics).

After that I want to create a second plasmoid which just shows a chart from
Yahoo! Finance. The most work will probably be to create a settings dialog similar
to the one you find [here][3] below the chart.

What do you think? Would you use a stocks plasmoid? What do you expect it to display?
Why didn't you have already used ruby to create a dataengine? `;)` And after all,
how do I get this engine into KDE trunk?

[img]:  {{ site.url }}/images/plasmaengineviewer_ruby_stocks_v1.0.png "Plasma DataEngine ruby-stocks made with Ruby"
[file]: {{ site.url }}/files/plasma-dataengine-ruby-stocks-v1.0.zip "Download Plasma package ruby-stocks v1.0"
[0]:    http://websvn.kde.org/trunk/playground/base/plasma/dataengines/stocksengine/ "Stocks engine made with C++ from KDE playground"
[1]:    http://websvn.kde.org/trunk/KDE/kdeexamples/plasma/ruby "Plasma Ruby examples in KDE kdeexamples"
[2]:    http://de.ichart.yahoo.com/z?s=NOK&t=5d&q=l&l=off&z=m&a=v&p=s "Stocks Chart for Nokia from Yahoo! Finance"
[3]:    http://de.finance.yahoo.com/q/bc?s=NOK&t=5d&l=off&z=m&q=l&c= "Stocks Chart for Nokia from Yahoo! Finance"