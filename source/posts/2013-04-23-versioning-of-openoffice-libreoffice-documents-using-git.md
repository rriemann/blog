---
# kate: hl markdown;
title: "Versioning of OpenOffice/LibreOffice documents using git"
date: 2013-04-23 08:38
comments: true
tags: [linux, tricks]
lang: en
---

**Update:** With the option to save documents directly in *Flat XML* format
(i.e. `*.fodt` instead of `*.odt`) within LibreOffice, this article is *obsolete*.
Flat XML files receive the best git versioning you can expect. The images in your
documents are embedded in the XML file as well. Thanks to Simon for this helpful
comment. However, in another [comment](#comment-2209333934) it was suggested to
still process the document to get rid of cursor markers that produce noise in
the diff.

At the moment I'm preparing my application documents for my job after finishing
my travels. Of course, I track changes of my LaTeX documents with the [git]
versioning system. This is pretty straight-forward, because LaTeX documents are
only plain text.

Beside this, I'm using as well some [LibreOffice] (compatible to OpenOffice)
documents, whose changes are not obvious as it uses a binary format. For sure, git
can handle binary files, but the log is not really helpfull.

    Binary files "a/overview.ods" and "b/overview.ods" differ
    
Since git version 1.6.1 or later, you can specify dedicated diff filters per
file extensions to track these files as well as plain text files.

<!-- more -->

Knowing that files [OpenDocument] files `*.ods`, `*.odt` or `*.odp` are only gziped folders of xml
files, it is perfectly obvious to extract the files before comparision. This way,
a plain text diff can be done. I'm using [odt2txt], which is available in the
openSUSE software archive.

Unfortunately, the whole file content is presented in one single, very long text
line. As git is based on tracking changing lines, this is not very helpfull. So
I decided to use additionally an XML file formatter (xmllint is already installed)
to solve this problem.

~~~bash
#!/usr/bin/env sh
# place this file to ~/bin/odf2prettytxt and have ~/bin in $PATH
set -o errexit
/usr/bin/odt2txt --raw "$@" | /usr/bin/xmllint --format -
~~~
OpenDocument Git Filter – *~/bin/odf2prettytxt*
{:.code-meta}

This filter must be announced to your git installation

    git config --global diff.odf.textconv "odf2prettytxt"
    
Lastly you can enable this filter per project/folder by adding a line to your
`.gitattributes` file. This is done for the `*.ods` files using this one liner.

    echo '*.ods diff=odf' >> .gitattributes

[LibreOffice]: http://www.libreoffice.org/
[git]: http://git-scm.com
[OpenDocument]: http://en.wikipedia.org/wiki/OpenDocument
[odt2txt]: http://stosberg.net/odt2txt/
