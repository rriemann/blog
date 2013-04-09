---
layout: post
title: Webcomic №17
subtitle: 'Quantifying someones character made easy'
png: '/images/webcomic/quantifiying_someones_character.png'
svg: '/images/webcomic/quantifiying_someones_character.svg'
license: cc-by-nc-sa
comments: true
categories: [webcomic]
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