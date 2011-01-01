---
layout: master
title: Blog Archive
---
[Subscribe](/atom.xml){:.float-right}

### Blog Archive
<table class='post-list'>
{% for post in site.posts %}
  <tr>
    <th><a href='{{ site.url }}{{ post.url }}'>{{ post.title }}</a></th>
    <td>{{ post.date | date_to_string }}</td>
    <td><a href='{{ site.url }}{{post.url}}#disqus_thread'>Comments</a></td>
  </tr>
{% endfor %}
</table>
