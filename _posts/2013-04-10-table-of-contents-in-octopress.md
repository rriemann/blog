---
# kate: hl markdown;
 
title: "Table Of Contents in Octopress"
date: 2013-04-10 09:29
comments: true
tags: [tricks, css, meta]
---

* list element with functor item
{:toc}

### Prologue

I'm still looking for an easy and proper solution to implement pictures with
subtitles and an original size pop-up for my blog. On the way I found some
interesting ideas to equip [Octopress], Hacker's Blog Engine, with a table of
contents.

So I stumbled upon [this article][origin] and really wondered about the
complexity of solutions other people found. So I just want to present the
solution that I found.

[origin]: http://brizzled.clapper.org/blog/2012/02/04/generating-a-table-of-contents-in-octopress/
[Octopress]: http://octopress.org/

<!--more-->


### Generating the Table Of Contents

I'm going to add some further TOC levels for demonstration purposes. `;)`

#### Using Kramdown

I use [kramdown] as Markdown converter in all my projects. The inventor claims,
that it could be the fastest converter so far. Additionally, it comes with some
nice extras. For instance, it can generate a TOC for you[^1].

To use kramdown within Octopress, you have to activate it in the `_config.yml` file.

    markdown: kramdown
    
#### Preparing your posts

The following code in your blog posts is replaced by the TOC after kramdown parsing.

    * list element with functor item
    {:toc}

### Styling

I applied the following [SCSS] code to realize the styling. Octopress already
knows how to generate valid CSS code out of it. The `@include shadow-box;`
is resolved by [Compass].

~~~css
#markdown-toc:before {
  content: "Table of Contents";
  font-weight: bold;
}
ul#markdown-toc {
  list-style: none;
  float: right;
  @include shadow-box;
  background-color: white;
}
~~~
Snippet for *sass/custom/_styles.scss*
{:.code-meta}

### Issues

One problem I came across is that the links of the TOC are only relative using
HTML anchors. So if only a part of your post is shown, because you made usage of
`<!--more-->` and the post is shown in your blog index page, it won't work.

I decided that I don't want to show the TOC in this case at all and added
additionally the following lines to my style description.

~~~css
.blog-index #markdown-toc {
  display: none;
}
~~~

[Compass]: http://compass-style.org/
[SCSS]: http://sass-lang.com/
[kramdown]: http://kramdown.rubyforge.org
*[TOC]: Table Of Contents
[^1]: <http://kramdown.rubyforge.org/converter/html.html#toc>
