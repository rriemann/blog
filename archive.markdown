---
layout: master
title: Archive
---
[Subscribe](/atom.xml){.float-right}

<h3>Blog Archive</h3>
<table class='post-list'>
{% for post in site.posts %}
  <tr>
    <th><a href='{{ post.url }}'>{{ post.title }}</a></th>
    <td>{{ post.date | date_to_string }}</td>
    <td><a href='{{post.url}}#disqus_thread'>Comments</a></td>
  </tr>
{% endfor %}
</table>

{% include disqus_comments_number.html %}