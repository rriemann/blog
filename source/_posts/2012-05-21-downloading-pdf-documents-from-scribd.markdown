---
layout: post
title: "Downloading PDF Documents from Scribd"
date: 2012-05-21 13:41
comments: true
categories: tricks
---

Are you also sometimes annoyed by only finding documents on <http://scribd.com> and
nowhere else? Furthermore this site is missing of a download or printing
opportunity – at least there is no one for ordinary vitors.

Fortunately there is a little trick which might help you to still download a
pdf:
For mobile visitors using a mobile browser (tested with Opera Mini), there is a
download button. You just have to:

1. use Firefox
2. Tell scribd untruly, that you are using Opera Mini
  * open a new tab and go to <about:config>
  * accept the security hint
  * use the context menu to create a new string named `general.useragent.override`
  * set the value of this string to `Opera/9.80 (J2ME/MIDP; Opera Mini/6.24288/25.729; U; en) Presto/2.5.25 Version/10.54`
3. visit the scribd page again and use the now appearing download button to reveive your pdf.
4. you should reset this string afterwards again to an empty value

If you need this regularly, you can install the
[Firefox Agent Switcher Plugin](https://addons.mozilla.org/en-US/firefox/addon/user-agent-switcher/)
for some automatization.

### References

* <http://vasuviroja.blogspot.in/2012/05/download-from-scribd-without-account_02.html>
* <http://johnbokma.com/mexit/2004/04/24/changinguseragent.html>