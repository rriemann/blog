---
title: "First Gem: jekyll-onebox"
date: "2018-04-03 23:15"
comments: true
lang: en
tags:
  - ruby
description: |
  I published my first Ruby gem. The Liquid tag jekyll-onebox allows to display HTML previews (embeds) for links to popular websites.
---

Initially, I wanted to blog about my travels. In the end, I refactored old code on my computer to publish eventually my first Ruby gem in the official repo at [RubyGems](https://rubygems.org/). Welcome now `jekyll-onebox` on [Github](https://github.com/rriemann/jekyll-onebox) and [RubyGems](https://rubygems.org/gems/jekyll-onebox)! :tada: :clap:

So if you use [Jekyll](http://jekyllrb.com/) for blogging, you can install this plugin and add HTML previews for links to popular websites very easily.

<!--more-->

```liquid
{% raw %}{% onebox https://github.com/rriemann/jekyll-onebox/blob/master/README.md %}{% endraw %}
```

The previews are rendered using the gem [onebox](https://github.com/discourse/onebox) that powers link previews for [Discourse](https://github.com/discourse/discourse) forums.

Have fun with it and let me know if you encounter problems!
