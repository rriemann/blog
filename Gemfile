source "https://rubygems.org"

ruby "2.7.2"

# Hello! This is where you manage which Jekyll version is used to run.
# When you want to use a different version, change it below, save the
# file and run `bundle install`. Run Jekyll with `bundle exec`, like so:
#
#     bundle exec jekyll serve
#
# This will help ensure the proper Jekyll version is running.
# Happy Jekylling!
gem "jekyll", "~> 4.1"

gem "jekyll-theme-hydejack", git: 'https://gitlab.com/rriemann/hydejack-pro.git', branch: 'gem-pro-v9'

# IMPORTANT: The followign gem is used to compile math formulas to
# KaTeX during site building.
#
# There are a couple of things to know about this gem:
# *  It is not supported on GitHub Pages.
#    You have to build the site on your machine before uploading to GitHub,
#    or use a more permissive cloud building tool such as Netlify.
# *  You need some kind of JavaScript runtime on your machine.
#    Usually installing NodeJS will suffice.
#    For details, see <https://github.com/kramdown/math-katex#documentation>
#
# If you're using the MathJax math engine instead, free to remove the line below:
gem "kramdown-math-katex"

# A JavaScript runtime for ruby that helps with running the katex gem above.
gem "duktape"

group :jekyll_plugins do
  gem "jekyll-default-layout"
  gem "jekyll-feed"
  gem "jekyll-optional-front-matter"
  gem "jekyll-paginate"
  gem "jekyll-readme-index"
  gem "jekyll-redirect-from"
  gem "jekyll-relative-links"
  gem "jekyll-seo-tag"
  gem "jekyll-sitemap"
  gem "jekyll-titles-from-headings"
  gem "jekyll-include-cache"

  # Non-Github Pages plugins:
  # gem "jekyll-last-modified-at"
  gem "jekyll-compose"

  # Custom to this blog
  gem "jemoji", "0.12.0"
  gem "jekyll-scholar", "~> 6.8"
  # Added at 2018-04-08 20:32:43 +0200 by rriemann:
  # gem "jekyll-flickr", "~> 0.1.2"
  gem 'jekyll-flickr', :git => 'https://github.com/rriemann/jekyll-flickr'
  gem "jekyll-maps", git: "https://github.com/rriemann/jekyll-maps", branch: "mapbox-geojson"
end

gem 'wdm' if Gem.win_platform?
gem "tzinfo-data" if Gem.win_platform?
