---
layout: post
title: Just moved to Jekyll
categories:
- meta
- css
---
* toc
{:toc}

# Static Website Generators

After using the static website generator [webgen][wg] I started to appreciate the idea not
to depend on special hosts with php, mysql and so on enabled. You can put all files on a CD
and it will works nevertheless. Like in the good old days, when there was only the notepad and
the Netscape Navigator.

My last blog was powered by [Movable Type][mt]. A really good, full-featured engine, but editing in
the ajax backend was damn slow, because I hosted Movable Type myself via a dynamic dns service. And
at home the provided upload rate is not good enough to host a page serious. I don't want to pay for
websites. There is so much *static* webspace in the www. So I switched over to the ruby[^rb] driven [Jekyll][jk]
and got in addtion the hosting for free on <http://github.com>.

# Building The Blog

I started with a copy of <http://github.com/schacon/schacon.github.com>. At this point a big "Horay!" to schacon
and open source, that made a quick start possible.

While editing the files I found some usefull tricks you, you maybe googled for.

## CSS selector for elements without `class` attribute

I wanted a template which allows to use nice CSS formatted `<code>` and `<pre>` tags for source code,
but on the other hand I didn't want to change the style of included code snippets from <http://pastie.org> or
<http://refactormycode.com>.

So I found out how to change only these html tags in the source code, which doesn't have an `class` attribute, because
that is exactly the difference between these pastie-snippets and my own `pre`-elements.

The solution is to use the [negation pseudo-class selector](http://www.w3.org/TR/css3-selectors/#negation).

{% highlight css %}
pre, code {
  font-family:Consolas,"Andale Mono","Courier New",Courier,mono !important;
  font-weight: 400;
  font-size:0.9em;
}

*:not(PRE) > code {
  background-color: #333;
  color: #fff;
}

pre:not([class]) {
  background-color: #333;
  border: 1px solid #000;
  color: #fff;
  margin: 1em 0;
  overflow: auto;
  padding: 0.5em;
}
{% endhighlight %}

First I define some basic font styles for all kind of code. After that I define styles for the code, which isn't
in a `pre`-element and at last follows the style for the pygments-generated in-built code.

## Integrating other static pages

As BSc physics student I got a userpage on the IT system of the physics institute, where I store some files.
Furthermore I have an account at [DESY](http://desy.de), from where I also get a userpage. So I thought it would
be nice to integrate both pages.

In the end I got it by defining a special header and footer in the .htaccess file for the Apache auto-generated directory index.

{% highlight apache %}
ReadmeName footer.html 
HeaderName header.html
IndexStyleSheet style.css
IndexIgnore style.css footer.html header.html
{% endhighlight %}

More explanation are on the [official Apache Module page](http://httpd.apache.org/docs/2.2/mod/mod_autoindex.html) given.

You might also want to look in my [blog sources](http://github.com/saLOUt/salout.github.com), where you can find [these
files](http://github.com/saLOUt/salout.github.com/tree/master/other_pages_integration/) in the "other_page_integration" folder.


## Generating pygments CSS files

I didn't found it immediately in the internet, so I want to increase the pages containting the hint by 1.

If you want to create the CSS file, maybe with the look and feel of <http://pastie.org>, try this in your cmd to
generate a complete "highlight.css".

    pygmentize -f html -a .highlight -S pastie > highlight.css

To get an overview over possible you have to execute this command:

    pygmentize -L styles

[wg]: http://webgen.rubyforge.org/
[jk]: http://jekyllrb.com/
[mt]: http://www.movabletype.org/

*[cmd]: command line, or console. On Linux i.e. bash.

[^rb]: [Ruby](http://www.ruby-lang.org) is the best language I ever saw. So the new system had to be based on it.
Syntax highlighting is done via [pygments](http://pygments.org/), which bases on python. Is that really necessary?
