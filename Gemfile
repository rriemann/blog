ruby "2.0.0"

source 'https://rubygems.org'

gem "puma"
gem "rack-contrib"
# gem "rack-tidy-ffi"

# gem "middleman"
gem "middleman", "~> 3.2.0" #, :platform => :mingw
#       gem "wdm", "~> 0.1", :platform => :mingw
gem "rb-inotify", "~> 0.9", :platform => :ruby
gem "middleman-livereload", :git => "git://github.com/middleman/middleman-livereload.git"
gem "middleman-smusher", :git  => "git://github.com/middleman/middleman-smusher.git"
gem "middleman-favicon-maker", :git => "git://github.com/follmann/middleman-favicon-maker.git"
gem "middleman-deploy"
gem "middleman-syntax"
gem "middleman-blog"

gem "kramdown"

gem "tzinfo" # timezones
gem 'nokogiri' # html ware post summaries


gem "slim"
gem "liquid"
# flickr plugin
gem 'flickraw-cached'
gem 'builder', '> 2.0.0'
gem 'persistent_memoize'
  
gem "compass-rgbapng"
# gem "bootstrap-sass"
gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass', :require => false

group :development do
  # gem 'heroku'
  gem 'foreman'
  gem 'therubyracer', :platform => :ruby
  gem 'oj'
end

group :production do
  gem 'therubyracer-heroku'
  gem 'oj'
end
