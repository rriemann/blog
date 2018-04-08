---
title: Belgrade Model EU 2015 Documents
date: 2015-11-05 18:58 CEST
comments: true
kate: hl markdown;
tags: [model-eu,linux,ruby]
keywords:
  - BETA e.V.
  - Model EU Belgrade (BEUM) 2015
lang: en
published: true
---

{% flickr 6201381800 "Paperback Book vs. Amazon Kindle" %}

**Dear participants of the Model European Union simulation 2015, I totally support the aim of the simulation organisers to print less paper during the conference.**

<!--more-->

So I will provide, as I did [last time](posts/2015-04-09-meu-strasbourg-2015-documents.html), the juridical texts in various eBook formats! The text used in the conference are shortened! The original sources are probably these ones:

Regulation:
: <http://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv:OJ.L_.2015.169.01.0001.01.ENG>

Directive:
: <http://eur-lex.europa.eu/legal-content/EN/TXT/?uri=OJ:JOL_2015_068_R_0001>


**BEUM Shortened Versions!** Please be aware of the fact that the
documents below are based on a modified, shortened version of the original texts.
{:.message}

### Regulation

Source: <https://gallery.mailchimp.com/a9ddb05b2c9bf890d75b042ac/files/BEUM2015_Regulation.docx>

In English:

* [ebook Kindle](http://people.physik.hu-berlin.de/~rriemann/beum2015/BEUM2015_Regulation.azw3)
* [ebook epub](http://people.physik.hu-berlin.de/~rriemann/beum2015/BEUM2015_Regulation.epub)
* [ebook mobi](http://people.physik.hu-berlin.de/~rriemann/beum2015/BEUM2015_Regulation.mobi)


### Directive

Source: <https://gallery.mailchimp.com/a9ddb05b2c9bf890d75b042ac/files/BEUM2015_Directive.docx>

In English:

* [ebook Kindle](http://people.physik.hu-berlin.de/~rriemann/beum2015/BEUM2015_Directive.azw3)
* [ebook epub](http://people.physik.hu-berlin.de/~rriemann/beum2015/BEUM2015_Directive.epub)
* [ebook mobi](http://people.physik.hu-berlin.de/~rriemann/beum2015/BEUM2015_Directive.mobi)


## How it is done

Save the following ruby script in an executable file called `formatter.rb`.

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
# %x[soffice --headless --convert-to docx #{source}]
docxfile = basename + '.docx'

# convert to ebook
%x[ebook-convert #{docxfile} #{basename}.mobi] # kindle old
%x[ebook-convert #{docxfile} #{basename}.azw3] # kindle new
%x[ebook-convert #{docxfile} #{basename}.epub] # default, legacy

# is there a pdf ?
# pdffile = "#{File.dirname(source)}/#{basename}.pdf"
# puts "pdf #{pdffile}"
# if File.exists? pdffile
#   %x[pdfbook --booklet false --signature '32' --suffix 'booklet' #{pdffile}]
# end
~~~

[Download formatter.rb](http://people.physik.hu-berlin.de/~rriemann/meu/formatter.rb)
