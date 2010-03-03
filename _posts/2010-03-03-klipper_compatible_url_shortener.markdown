---
layout: post
title: Klipper-compatible URL-Shortener Script
categories:
- kde
- ruby
---

#The next Klipper action

In my [last][last] blog entry I explained how to send the clipboard content via
KDE Klipper to a pastebin service.

Now I wrote a quick-and-dirty script to transform a URI in the clipboard to a
shortenend version using <http://ur1.ca> (U R One; it is GPL).

I never figured out how to get automatic URL shortening with <http://identi.ca>
and [Choqok][choq]. That's a kind of universal work-around for me.

Copy the file ur1.rb to a folder which is in your `$PATH` and add a Klipper
action as I explained in the last post. To setup your Klipper action you will
need the following:

RegExp for matching URLs
:   `(^(http|https|ftp):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)`

Command for Klipper action
:   `ur1.rb %s`

You can trigger actions manually by `<Ctrl>+<Alt>+<R>` (KDE default).


[last]: {{ site.url }}/blog/2010/03/03/awesome_klipper_workflow.html "How to configure Klipper to work with pastie.rb script"
[choq]: http://choqok.gnufolks.org/ "Open Source KDE Mikroblogging Client"


# ur1.rb

Copy this file to your `~/bin` and make it executable.

Usage
:   `ur1.rb URL`

Example
:   `ur1.rb http://linux.com`

The script will return the url in case of no errors and otherwise a short string
indicating the error.

{% highlight ruby %}
#!/usr/bin/env ruby
# kate: remove-trailing-space on; replace-trailing-space-save on; indent-width 2; indent-mode ruby; syntax ruby;
# ur1.rb

require 'net/http'
require 'cgi'
require 'uri'

URL = URI.parse "http://ur1.ca/"
raise if ARGV.size == 0
longurl = ARGV[0]

http = Net::HTTP.new URL.host, URL.port

query_string = "longurl=#{CGI.escape longurl}"

response, body = http.start do |http|
  http.post URL.path, query_string
end

abort "error (wrong response code)" unless response.code == '200'

puts (body[/<p class="success">Your ur1 is: <a href="(.+)"/,1] or "error (no url returned)")
{% endhighlight %}