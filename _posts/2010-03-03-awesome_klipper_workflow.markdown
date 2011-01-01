---
layout: post
title: Awesome Klipper Workflow
categories:
- kde
- ruby
---

# Copy your clipboard to the pastebin

![Klipper Pastie.org Menu][menu]{:.right}
When you are a power IRC user, you might know the problem. You cannot copy the
whole source code, error message or log file etc. directly in the IRC channel.
You need a pastebin. I like <http://pastie.org> really much. It has a clean
interface and supports highlighting for many languages. But how to copy the text
to the pastebin in a handy and short way?

Do the following to copy the clipboard content to the pastebin by a simple
`<Ctrl>+<Alt>+<R>` (global shortcut to open Klipper actions) and a click:

- Copy the file pastie.rb to a folder which is in your `$PATH`
- Make the file executable for you
- Edit the actions of Klipper and add for the `.*` Regexp (means: no special string)
  a new action (do not activate automatic).
- Add the command `echo '%s' | pastie.rb`, feedback should go to clipboard and
  set the description to "post as plain text" for instance
- You can add another command `echo '%s' | pastie.rb -f ruby` to paste the text with
  ruby syntax highlighting

![Klipper Pastie.org Settings][settings]{:.right}
After that you should be able to send your clipboard to the pastebin with one
selection (to copy text into clipboard), one hotkey (to trigger Klipper actions)
and one click (to choose between different highlighters). You can paste the URL
with a single click on the middle button of your mouse. You don't even have to
open the pastebin page yourself!

I like it. Just want to share this with you in the case you was locking for
something similiar. `:)`

[menu]: {{ site.url }}/images/klipper_pastie_menu.png
[settings]: {{ site.url }}/images/klipper_pastie_settings.png


# pastie.rb

Copy this file to your `~/bin` and make it executable.

A big thank to the unknown author of this file. I found it via google on
<http://pastie.org> and did only some minor modifications on it.

You can use the pastie.rb script via command line by pipe a file to it.
To set the code highlighting use the switch `-f LANG`. To get all supported
languages you want to try a `pastie.rb -h`.

{% highlight ruby %}
#!/usr/bin/env ruby
# kate: remove-trailing-space on; replace-trailing-space-save on; indent-width 2; indent-mode ruby; syntax ruby;
# file: pastie.rb

require 'net/http'
require 'optparse'
require 'timeout'
require 'cgi'
require 'uri'

class Hash

  def to_query_string
    map { |k, v|
      if v.instance_of?(Hash)
        v.map { |sk, sv|
          "#{k}[#{sk}]=#{sv}"
        }.join('&')
      else
        "#{k}=#{v}"
      end
    }.join('&')
  end

end

module Pastie

  AVAILABLE_PARSERS = %w( objective-c++ actionscript ruby ruby_on_rails diff
    plain_text c++ css java javascript html html_rails shell shell-unix-generic
    sql php python pascal perl yaml csharp go apache lua io lisp d erlang fortran
    haskell literate_haskell makefile scala scheme smarty ini nu tex clojure
  )

  class API

    PASTIE_URL = URI.parse "http://pastie.org/pastes"

    def paste(body, format = 'plain_text', is_private = false)
      raise InvalidParser unless valid_parser? format

      http = Net::HTTP.new PASTIE_URL.host, PASTIE_URL.port

      query_string = { :paste => {
        :body => CGI.escape(body),
        :parser => format,
        :restricted => is_private,
        :authorization => 'burger'
      }}.to_query_string

      response, body = http.start do |http|
        http.post PASTIE_URL.path, query_string
      end

      raise Pastie::Error unless response.code == '302'

      response['location']
    end

    private

    def valid_parser?(format)
      Pastie::AVAILABLE_PARSERS.include? format
    end

  end

  class Error < StandardError; end
  class InvalidParser < StandardError; end

  class ConsoleOptions

    attr_reader :parser, :options

    def initialize
      @options = {
        :format => 'plain_text',
        :private => false
      }

      @parser = OptionParser.new do |cmd|
        cmd.banner = "Ruby Pastie CLI - takes paste input from STDIN"

        cmd.separator ''

        cmd.on('-h', '--help', 'Displays this help message') do
          puts @parser
          exit
        end

        cmd.on('-f', '--format FORMAT', "The format of the text being pasted. Available parsers: #{Pastie::AVAILABLE_PARSERS.join(', ')}") do |format|
          @options[:format] = format
        end

        cmd.on('-p', '--private', 'Create a private paste') do
          @options[:private] = true
        end
      end
    end

    def run arguments
      @parser.parse!(arguments)

      body = ''

      Timeout.timeout(1) do
        body += STDIN.read
      end

      if body.strip.empty?
        puts "Please pipe in some content to paste on STDIN."
        exit 1
      end

      pastie = API.new
      puts pastie.paste(body, @options[:format], @options[:private])

      exit 0
    rescue InvalidParser
      puts "Please specify a valid format parser."
      exit 1
    rescue Error
      puts "An unknown error occurred"
      exit 1
    rescue Timeout::Error
      puts "Could not read from STDIN."
      exit 1
    end
  end
end

if ($0 == __FILE__)
  app = Pastie::ConsoleOptions.new
  app.run(ARGV)
end
{% endhighlight %}