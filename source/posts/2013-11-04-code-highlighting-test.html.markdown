---
title: Code Highlighting Test
date: 2013-11-04 00:43 CET
published: false
tags:
- test
---

Here the comparison

~~~shell
#!/usr/bin/env sh

rm out*.jpg
rm out*.gif
ffmpeg -y -i 13040065.mp4 -t 1 -filter:v transpose=1,scale=400:-1,deshake,crop=400:400 out%02d.jpg

for file in *.jpg; do
  convert $file ${file%.*}.gif
done
gifsicle --delay=5 --colors 256 --loop out*.gif > final.gif
convert final.gif -layers Optimize final.gif

rm out*.jpg
rm out*.gif
~~~
und nun: *Das ist die Metazeile*
{: .code-meta}


<script src="https://gist.github.com/rriemann/5404791.js"></script>