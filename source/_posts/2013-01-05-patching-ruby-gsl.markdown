---
# kate: hl markdown;
layout: post
title: "Patching Ruby Gem GSL"
date: 2013-01-05 14:21
comments: true
categories: [tricks, linux, meta, ruby]
---

The [Github Gist](http://gist.github.com/) code pasting service received
some updates, which breaks the layout of the embedding tags used by this blogging
engine octopress ([Issue #847](http://github.com/imathis/octopress/issues/847)).

This issue was already fixed and got included in the development branch 2.1.
I decided to upgrade my blog to the latest development version. Afterwards the
Ruby version manager [rvm](http://rvm.io/) asked to install a new ruby version.
To meet the exact requirements of octopress I decided to give it a run, but when
installing the required gems using `bundle install` I wasn't able to
install [gsl](http://rb-gsl.rubyforge.org/), the ruby binding to the GNU
scientific library, which is used to speed-up the "related posts" calculation.
I remembered to run into this problem once before. Unfortunately it isn't
resolved yet. `:(`

    vector_complex.c:1989:12: error: conflicting types for 'gsl_vector_complex_equal'
    /usr/include/gsl/gsl_vector_complex_double.h:167:5: note: previous declaration of 'gsl_vector_complex_equal' was here
    make: *** [vector_complex.o] Error 1

<!-- more -->

### Solution

To get this gem installed nevertheless, you have to patch the sources of the
native extension. For this, you have to find the building directory `ext`, which
should be mentioned in the error message.

Put the patch `rb-gsl.patch` from below in this directory or download it using

    wget 'https://gist.github.com/raw/2296214/c6b1c7150713da5d2640ddc799132611ac72cef4/rb-gsl.patch'

Then you have to apply the patch using `patch -p2 < rb-gsl.patch` from within the
`ext` directory. To build the extension finally, you have to run the command
`make -j4`. If you proceed with bundle install again, the source code will be unzipped
again leaving you with same unpatched code as before. To work around this issue,
a hint is given in the help of the gem install commmand (`gem install --help`).

    If you correct the compilation errors by editing the gem files you will need
        to write the specification by hand.  For example:

          $ gem install some_extension_gem
          [build fails]
          Gem files will remain installed in \
          /path/to/gems/some_extension_gem-1.0 for inspection.
          Results logged to /path/to/gems/some_extension_gem-1.0/gem_make.out
          $ [cd /path/to/gems/some_extension_gem-1.0]
          $ [edit files or what-have-you and run make]
          $ gem spec ../../cache/some_extension_gem-1.0.gem --ruby > \
                    ../../specifications/some_extension_gem-1.0.gemspec
          $ gem list some_extension_gem

So I just did as I got told (still in `exe` directory):

     gem spec ../../../cache/gsl-1.14.7.gem --ruby > ../../../specifications/gsl-1.14.7.gemspec

Afterwards `bundle install` will accept this gem. That's it!

### Patch rb-gsl.patch

{% gist 2296214 rb-gsl.patch %}