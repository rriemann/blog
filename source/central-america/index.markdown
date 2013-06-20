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

<iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.de/maps?f=q&amp;source=s_q&amp;hl=de&amp;geocode=&amp;q=Boquete,+Chiriqu%C3%AD,+Panama&amp;aq=0&amp;oq=Boquete&amp;sll=25.790654,-80.130046&amp;sspn=0.722107,1.279907&amp;t=h&amp;ie=UTF8&amp;hq=&amp;hnear=Bajo+Boquete,+Chiriqu%C3%AD,+Panama&amp;z=7&amp;iwloc=A&amp;output=embed"></iframe>


[Größere Kartenansicht][map]

[map]: https://maps.google.de/maps?f=q&amp;source=embed&amp;hl=de&amp;geocode=&amp;q=Boquete,+Chiriqu%C3%AD,+Panama&amp;aq=0&amp;oq=Boquete&amp;sll=25.790654,-80.130046&amp;sspn=0.722107,1.279907&amp;t=h&amp;ie=UTF8&amp;hq=&amp;hnear=Bajo+Boquete,+Chiriqu%C3%AD,+Panama&amp;z=7&amp;iwloc=A