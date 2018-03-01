---
title: MEU Strasbourg 2015 Documents
date: 2015-04-09 16:58 CEST
comments: true
kate: hl markdown;
tags: [meu2015]
keywords:
  - BETA e.V.
  - MEU Strasbourg
lang: en
published: true
---


<%= flickr_tag 6201381800, size: 'b', title: 'best-practice (paper-free) reading of EU regulations' %>

### Dear participants of the Model European Union simulation 2015,

We have been asked to read quite a lot of papers. Instead of printing them out as
you find them on the server. I generated some derivates that you hopefully find
usefull.

<!-- more -->

#### Data Protection Regulation

Source: <http://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:52012PC0011>   
All files: <http://people.physik.hu-berlin.de/~rriemann/meu/Data-Protection-Regulation/>

In English:

* [ebook Kindle](http://people.physik.hu-berlin.de/~rriemann/meu/Data-Protection-Regulation/CELEX_52012PC0011_EN_TXT.azw3)
* [ebook epub](http://people.physik.hu-berlin.de/~rriemann/meu/Data-Protection-Regulation/CELEX_52012PC0011_EN_TXT.epub)
* [ebook mobi](http://people.physik.hu-berlin.de/~rriemann/meu/Data-Protection-Regulation/CELEX_52012PC0011_EN_TXT.mobi)
* [booklet for duplex printing](http://people.physik.hu-berlin.de/~rriemann/meu/Data-Protection-Regulation/CELEX_52012PC0011_EN_TXT-booklet.pdf)

In German:

* [ebook Kindle](http://people.physik.hu-berlin.de/~rriemann/meu/Data-Protection-Regulation/CELEX_52012PC0011_DE_TXT.azw3)
* [ebook epub](http://people.physik.hu-berlin.de/~rriemann/meu/Data-Protection-Regulation/CELEX_52012PC0011_DE_TXT.epub)
* [ebook mobi](http://people.physik.hu-berlin.de/~rriemann/meu/Data-Protection-Regulation/CELEX_52012PC0011_DE_TXT.mobi)
* [booklet for duplex printing](http://people.physik.hu-berlin.de/~rriemann/meu/Data-Protection-Regulation/CELEX_52012PC0011_DE_TXT-booklet.pdf)




#### Single Resolution Mechanism

Source: <http://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:52013PC0520>   
All files: <http://people.physik.hu-berlin.de/~rriemann/meu/Single-Resolution-Mechanism/>

In English:

* [ebook Kindle](http://people.physik.hu-berlin.de/~rriemann/meu/Single-Resolution-Mechanism/CELEX_52013PC0520_EN_TXT.azw3)
* [ebook epub](http://people.physik.hu-berlin.de/~rriemann/meu/Single-Resolution-Mechanism/CELEX_52013PC0520_EN_TXT.epub)
* [ebook mobi](http://people.physik.hu-berlin.de/~rriemann/meu/Single-Resolution-Mechanism/CELEX_52013PC0520_EN_TXT.mobi)
* [booklet for duplex printing](http://people.physik.hu-berlin.de/~rriemann/meu/Single-Resolution-Mechanism/CELEX_52013PC0520_EN_TXT-booklet.pdf)
  (staple together each consecutive 8 sheets)

In German:

* [ebook Kindle](http://people.physik.hu-berlin.de/~rriemann/meu/Single-Resolution-Mechanism/CELEX_52013PC0520_DE_TXT.azw3)
* [ebook epub](http://people.physik.hu-berlin.de/~rriemann/meu/Single-Resolution-Mechanism/CELEX_52013PC0520_DE_TXT.epub)
* [ebook mobi](http://people.physik.hu-berlin.de/~rriemann/meu/Single-Resolution-Mechanism/CELEX_52013PC0520_DE_TXT.mobi)
* [booklet for duplex printing](http://people.physik.hu-berlin.de/~rriemann/meu/Single-Resolution-Mechanism/CELEX_52013PC0520_DE_TXT-booklet.pdf)
  (staple together each consecutive 8 sheets)


#### Single Supervisory Mechanism

Source: <http://eur-lex.europa.eu/legal-content/EN/TXT/?qid=1428583392976&uri=CELEX:52012PC0511>   
All files: <http://people.physik.hu-berlin.de/~rriemann/meu/Single-Supervisory-Regulation/>

In English:

* [ebook Kindle](http://people.physik.hu-berlin.de/~rriemann/meu/Single-Supervisory-Mechanism/CELEX_52012PC0511_EN_TXT.azw3)
* [ebook epub](http://people.physik.hu-berlin.de/~rriemann/meu/Single-Supervisory-Mechanism/CELEX_52012PC0511_EN_TXT.epub)
* [ebook mobi](http://people.physik.hu-berlin.de/~rriemann/meu/Single-Supervisory-Mechanism/CELEX_52012PC0511_EN_TXT.mobi)
* [booklet for duplex printing](http://people.physik.hu-berlin.de/~rriemann/meu/Single-Supervisory-Mechanism/CELEX_52012PC0511_EN_TXT-booklet.pdf)
  (staple together each consecutive 8 sheets)

In German:

* [ebook Kindle](http://people.physik.hu-berlin.de/~rriemann/meu/Single-Supervisory-Mechanism/CELEX_52012PC0511_DE_TXT.azw3)
* [ebook epub](http://people.physik.hu-berlin.de/~rriemann/meu/Single-Supervisory-Mechanism/CELEX_52012PC0511_DE_TXT.epub)
* [ebook mobi](http://people.physik.hu-berlin.de/~rriemann/meu/Single-Supervisory-Mechanism/CELEX_52012PC0511_DE_TXT.mobi)
* [booklet for duplex printing](http://people.physik.hu-berlin.de/~rriemann/meu/Single-Supervisory-Mechanism/CELEX_52012PC0511_DE_TXT-booklet.pdf)
  (staple together each consecutive 8 sheets)

### How it is done

~~~ruby
#!/usr/bin/env ruby

if ARGV.first == "--help" or ARGV.size == 0
  puts <<-EOF
usage: formatter.rb SOURCE_FILE

Creates ebooks in various formats and if there is a pdf with same name in
same folder, it creates a booklet ready for duplex printing (long-edge).

Source file has to be supported by libreoffice. Requires libreoffice (soffice),
pdfjam (pdfbook), and calibre (ebook-convert)
Copyright 2014 Robert Riemann - licensed under GPL v2 or higher.
  EOF
  exit
end

source = File.expand_path ARGV.first
abort("ERROR: File #{source} doesn't exist.") unless File.exists? source

basename = File.basename source, '.*'

puts "source #{source}"

# prepare for input filter of ebook-convert
%x[soffice --headless --convert-to docx #{source}]

docxfile = basename + '.docx'

# convert to ebook
%x[ebook-convert #{docxfile} #{basename}.mobi] # kindle old
%x[ebook-convert #{docxfile} #{basename}.azw3] # kindle new
%x[ebook-convert #{docxfile} #{basename}.epub] # default, legacy

# is there a pdf ?
pdffile = "#{File.dirname(source)}/#{basename}.pdf"
puts "pdf #{pdffile}"
if File.exists? pdffile
  %x[pdfbook --booklet false --signature '32' --suffix 'booklet' #{pdffile}]
end
~~~
ruby script *formatter.rb*
{: .code-meta}

[Download formatter.rb](http://people.physik.hu-berlin.de/~rriemann/meu/formatter.rb)

