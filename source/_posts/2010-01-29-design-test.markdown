---
layout: post
title: First Test Post
categories:
- meta
---

* toc
{:toc}

# This is a markdown, jekyll blog post test page

Technorati Token: 59JNJK4EH86E

## Lists

- safd
- sdaf2

1. the frist one of an ordered list
2. the second one


Definition list
: something very hard to parse
Apples
: not here

## Links

a [link to wiki](http://wikipedia.org) between text <br />
safd sdaf a fsdf sfd

* Use of footnotes [^foot].
* abbreviations or ABB for short.

## quotes

Quote from Wikipedia:
> A blog (a contraction of the term "web log") is a type of website, usually maintained by an individual with regular entries of commentary, descriptions of events, or other material such as graphics or video. Entries are commonly displayed in reverse-chronological order. "Blog" can also be used as a verb, meaning to maintain or add content to a blog.
>
> Many blogs provide commentary or news on a particular subject; others function as more personal online diaries. A typical blog combines text, images, and links to other blogs, Web pages, and other media related to its topic. The ability of readers to leave comments in an interactive format is an important part of many blogs. Most blogs are primarily textual, although some focus on art (Art blog), photographs (photoblog), videos (Video blogging), music (MP3 blog), and audio (podcasting). Microblogging is another type of blogging, featuring very short posts.
>
> As of December 2007, blog search engine Technorati was tracking more than 112,000,000 blogs.

## tables


*   tables

    Col1 | Very very long head | Very very long head|
    -----|:-------------------:|-------------------:|
    cell | center-align        | right-align        |


*   footnotes [^foot]


# Code

## simple

First a command in `backticks`

    > simple commands
    > exit 0



## with highlighting by pygments

{% highlight ruby linenos %}
#!/usr/bin/env ruby

$KCODE = 'u'
require 'korundum4'

about = KDE::AboutData.new("ktest", "", KDE.ki18n("KTest"), "0.1")
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

{% highlight ruby %}
#!/usr/bin/env ruby

$KCODE = 'u'
require 'korundum4'

about = KDE::AboutData.new("ktest", "", KDE.ki18n("KTest"), "0.1")
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

## from refactormycode

<div style="overflow:auto;border:solid 1px #ccc;background:#000;color:#F8F8F8">
          <div class="section">
            
            <pre class="" style="float:left;margin:0 10px;border-right:0;color:#666;">1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17</pre>
            <pre class="sunburst"><span style="color:#AEAEAE;font-style:italic;"><span style="color:#AEAEAE;font-style:italic;">#</span>!/usr/bin/env ruby</span>

<span style="color:#3E87E3;"><span style="color:#3E87E3;">$</span>KCODE</span> <span style="color:#E28964;">=</span> <span style="color:#65B042;"><span style="color:#65B042;">'</span>u<span style="color:#65B042;">'</span></span>
<span style="color:#E28964;">require</span> <span style="color:#65B042;"><span style="color:#65B042;">'</span>korundum4<span style="color:#65B042;">'</span></span>

about <span style="color:#E28964;">=</span> <span style="color:#3E87E3;">KDE</span>::<span style="color:#89BDFF;">AboutData</span>.<span style="color:#89BDFF;">new</span>(<span style="color:#65B042;"><span style="color:#65B042;">&quot;</span>ktest<span style="color:#65B042;">&quot;</span></span>, <span style="color:#65B042;"><span style="color:#65B042;">&quot;</span><span style="color:#65B042;">&quot;</span></span>, <span style="color:#3E87E3;">KDE</span>.<span style="color:#89BDFF;">ki18n</span>(<span style="color:#65B042;"><span style="color:#65B042;">&quot;</span>KTest<span style="color:#65B042;">&quot;</span></span>), <span style="color:#65B042;"><span style="color:#65B042;">&quot;</span>0.1<span style="color:#65B042;">&quot;</span></span>)
<span style="color:#3E87E3;">KDE</span>::<span style="color:#89BDFF;">CmdLineArgs</span>.<span style="color:#89BDFF;">init</span>(<span style="color:#3E87E3;">ARGV</span>, about)
a <span style="color:#E28964;">=</span> <span style="color:#3E87E3;">KDE</span>::<span style="color:#89BDFF;">Application</span>.<span style="color:#89BDFF;">new</span>
w <span style="color:#E28964;">=</span> <span style="color:#3E87E3;">KDE</span>::<span style="color:#89BDFF;">PushButton</span>.<span style="color:#89BDFF;">new</span>( <span style="color:#65B042;"><span style="color:#65B042;">&quot;</span>Click me to quit<span style="color:#65B042;">&quot;</span></span> ) <span style="color:#E28964;">do</span>
  <span style="color:#89BDFF;">connect</span>( <span style="color:#3E87E3;">SIGNAL</span> <span style="color:#3387CC;"><span style="color:#3387CC;">:</span>clicked</span> ) <span style="color:#E28964;">do</span>
    puts <span style="color:#65B042;"><span style="color:#65B042;">&quot;</span>Do something else<span style="color:#65B042;">&quot;</span></span>
    <span style="color:#3E87E3;">KDE</span>::<span style="color:#89BDFF;">Application</span>.<span style="color:#89BDFF;">instance</span>.<span style="color:#89BDFF;">quit</span>
  <span style="color:#E28964;">end</span>
<span style="color:#E28964;">end</span>
w.<span style="color:#89BDFF;">show</span>

a.<span style="color:#89BDFF;">exec</span>
</pre>
          </div>
        </div>

<a href="http://refactormycode.com/codes/968-minimal-code-example-ruby-and-kde" style="color:#fff" title="As seen on RefactorMyCode.com"><img alt="Small_logo" src="http://refactormycode.com/images/small_logo.gif" style="border:0" /></a>


## from pastie.org

<script src='http://pastie.org/788392.js'> </script>


[^foot]: I really was missing those.

[ABB]: Simply an abbreviation



