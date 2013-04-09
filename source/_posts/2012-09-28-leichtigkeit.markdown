---
layout: post
title: Webcomic №15
subtitle: 'Leichtigkeit des Seins oder leichtsinnig sein'
png: '/images/webcomic/leichtigkeit.png'
svg: '/images/webcomic/leichtigkeit.svg'
license: cc-by-nc-sa
comments: true
categories: [webcomic, german]
---
<p>
  <img class="webcomic" src="{{ root_url }}{{ page.png }}" alt="{{ page.subtitle }}" title="{{ page.subtitle }}">
  <br>
  {{ page.subtitle }}
  {% if page.svg %}
  <br>
  <a href="{{ root_url }}{{ page.svg }}" title="SVG from Inkscape">SVG Source</a>
  {% endif %}

  {% if page.license == 'cc-by-nc-sa' %}
  <br>
  <a href="http://creativecommons.org/licenses/by-nc-sa/2.0/" title="Creative Commons Attribution-NonCommercial-ShareAlike 2.0 Generic"><img class="noborder" src="{{ root_url }}/images/by-nc-sa.eu.png" title="Creative Commons Attribution-NonCommercial-ShareAlike 2.0 Generic"></a>
  {% endif %}
</p>