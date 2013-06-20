---
# kate: hl markdown;
layout: page
title: "Mittelamerika-Spezial Übersicht"
date: 2013-03-31 10:00
comments: false
footer: false
categories: [central-america]
---

Vom 31. März bis zum 30. Juli bin ich in Mittelamerika unterwegs.

## Letzte Mittelamerika-Blog Posts##

<div id="blog-archives">
{% for post in site.categories['central-america'] limit: 5 reverse %}
{% capture this_year %}{{ post.date | date: "%Y" }}{% endcapture %}
{% unless year == this_year %}
  {% assign year = this_year %}
  <h2>{{ year }}</h2>
{% endunless %}
<article>
  {% include archive_post.html %}
</article>
{% endfor %}
</div>

[Alle Mittelamerika-Blog Posts]({{ root_url }}/categories/central-america/)   
[RSS Feed der Mittelamerika-Posts]({{ root_url }}/categories/central-america/atom.xml)

## Aktuelle Route in Lateinamerika

<iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?q=http:%2F%2Fblog.riemann.cc%2Fcentral-america%2Fmap.kml&amp;ie=UTF8&amp;t=m&amp;z=5&amp;output=embed"></iframe>

[Größere Kartenansicht][map]

[map]: https://maps.google.com/maps?q=http:%2F%2Fblog.riemann.cc%2Fcentral-america%2Fmap.kml