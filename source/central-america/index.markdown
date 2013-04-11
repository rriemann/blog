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

## Aktueller Standort

<iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.de/maps?f=q&amp;source=embed&amp;hl=de&amp;geocode=&amp;q=Mare+Gailard,+Guadeloupe&amp;aq=&amp;sll=16.14963,-61.39705&amp;sspn=1.461532,2.559814&amp;ie=UTF8&amp;hq=&amp;hnear=Mare+Gailard,+Le+Gosier,+Grande-Terre,+Guadeloupe&amp;t=h&amp;ll=16.804541,-60.644531&amp;spn=14.687336,26.367188&amp;z=5&amp;output=embed"></iframe>

[Größere Kartenansicht][map]

[map]: https://maps.google.de/maps?f=q&amp;source=embed&amp;hl=de&amp;geocode=&amp;q=Mare+Gailard,+Guadeloupe&amp;aq=&amp;sll=16.14963,-61.39705&amp;sspn=1.461532,2.559814&amp;ie=UTF8&amp;hq=&amp;hnear=Mare+Gailard,+Le+Gosier,+Grande-Terre,+Guadeloupe&amp;t=h&amp;ll=16.804541,-60.644531&amp;spn=14.687336,26.367188&amp;z=5