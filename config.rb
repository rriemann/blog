###
# Compass
###

# Susy grids in Compass
# First: gem install susy --pre
# require 'susy'
require 'rgbapng'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end
ready do
  blog.tags.each do |tag, articles|
    page "/tags/#{tag}/atom.xml", proxy: "/atom.xml", layout: false do
      #@articles = blog.articles[0..10]
      @tagname = tag
      @articles = articles[0..10]
    end
  end
#   page "/tags/kde/atom.xml", proxy: "/atom.xml", layout: false do
#     #@articles = blog.articles[0..10]
#     @articles = blog.tags['kde']
#   end
end

# ready do
#   blog.tags.each do |tag, articles|
#     puts tag
#     proxy "/tags/#{tag}/atom.xml", "/atom.xml.builder", locals: { tag: tag, articles: articles}, ignore: true
#   end
#   # proxy "/atom.xml", "/atom.xml.builder", locals: { articles: blog.articles[0..10]}, ignore: true
# end

###
# Blog settings
###

Time.zone = "Paris" # default : UTC

activate :blog do |blog|
  # blog.prefix = "blog"
  # blog.permalink = ":year/:month/:day/:title.html"
  # blog.sources = ":year-:month-:day-:title.html"
  # blog.taglink = "tags/:tag.html"
  blog.layout = "post"
  # blog.summary_separator = /(READMORE)/
  blog.summary_separator = /<!--\s?more\s?-->/
  blog.summary_length = BigDecimal::INFINITY
  # blog.summary_length = 250
  # blog.year_link = ":year.html"
  # blog.month_link = ":year/:month.html"
  # blog.day_link = ":year/:month/:day.html"
  # blog.default_extension = ".markdown"
  blog.sources = "posts/:year-:month-:day-:title.html"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/:num"
end

###
# Helpers
###

# Syntax Highlighting
activate :syntax, line_numbers: true

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Slim configuration
set :slim, {
  :format  => :html5,
  :indent => '    ',
  :pretty => true,
  :sort_attrs => false
}


# Assets PATH
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
# set :build_dir, 'tmp'
set :partials_dir, 'partials'

# Livereload
# use: https://github.com/middleman/middleman-livereload
activate :livereload

# make /praxis.html appear as /praxis
activate :directory_indexes
set :trailing_slash, true

set :markdown_engine, :kramdown # now default
set :markdown, :parse_block_html => true

# Dir[File.dirname(__FILE__) + '/lib/tags/*.rb'].each {|file| require file }
# require 'lib/tags/image_tag'
require "lib/custom_helpers"
helpers CustomHelpers
require "lib/flickr_helpers"
helpers FlickrHelpers

# require 'rack-tidy-ffi'
# use RackTidyFFI

activate :deploy do |deploy|
  # deploy.build_before = true # default: false
  deploy.method   = :git
  # deploy.remote = "custom-remote" # remote name or git url, default: origin
  # deploy.branch = "custom-branch" # default: gh-pages
  deploy.branch = "master"
end

configure :development do
  set :disqus, 'worthmentioning-testing'
  set :host, 'localhost:4567'
end

# Build-specific configuration
configure :build do
  
  set :disqus, 'worthmentioning'
  set :host,   'blog.riemann.cc'

  # Or use a different image path
  # set :http_path, "/Content/images/"

  # Make favicons
  # use: https://github.com/follmann/middleman-favicon-maker
  activate :favicon_maker

  # Minify
  # see: https://github.com/middleman/middleman-guides/blob/master/source/advanced/file-size-optimization.html.markdown#compressing-images
  activate :minify_css
  activate :minify_javascript

  # Enable cache buster
  # see: https://github.com/middleman/middleman-guides/blob/master/source/advanced/improving-cacheability.html.markdown#cache-buster-in-query-string
  activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # use: https://github.com/middleman/middleman-smusher
  # activate :smusher

  # Gzip HTML, CSS, and JavaScript
  # see: https://github.com/middleman/middleman-guides/blob/master/source/advanced/file-size-optimization.html.markdown#gzip-text-files
  # activate :gzip
  
  # this part ensures, that gz-files are delivered by the Apache server using content negotiation.
  # without renaming the i.e. "index.html" to "index.html.txt" it will receive priority and "index.html.gz" will not be used in any case
#   after_build do |builder|
#     Dir.chdir(::Middleman::Application.server.inst.build_dir) do
#       files = Dir.glob('**/*.gz')
#       files.map { |file| file[0..-4] }.each do |f| # find corresponding non-gz file by removing ".gz" at the end
#         unless File.directory?(f)
#           output_filename = f + '.txt'
#           File.rename(f, output_filename)
#           builder.say_status :mv, output_filename
#         end
#       end
#     end
#   end

end
