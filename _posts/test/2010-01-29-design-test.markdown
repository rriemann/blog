---
layout: post
title: First Test Post
---

- safd
- sdaf2

* This will become a table of contents (this text will be scraped).
{:toc}

# Head 1

# Head 2

> Blogquote
> Blogquote again

## Head 2.1

* footnotes [^foot]

Definition list
: something very hard to parse

*   abbreviations or ABB for short.


Examples of PHP Markdown Extra syntax {#extra}
-------------------------------------

*   tables

        Col1 | Very very long head | Very very long head|
        -----|:-------------------:|-------------------:|
        cell | center-align        | right-align        |
    {:markdown}

    Col1 | Very very long head | Very very long head|
    -----|:-------------------:|-------------------:|
    cell | center-align        | right-align        |


*   footnotes [^foot]

Nun in `Backticks` etwas Code.

    codeline1
    codeline2


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

<script src='http://pastie.org/788392.js'> </script>


[^foot]: I really was missing those.

[ABB]: Simply an abbreviation



