module Jekyll
  class YoutubeTag < Liquid::Tag
    def initialize(name, id, tokens)
      super
      @id = id
    end

    def render(context)
      # http://instant-thinking.de/2012/03/02/youtube-videos-einbetten-mit-octopress-und-kramdown/
      # %(<iframe class="youtube-player" type="text/html" width="#{@@width}" height="#{@@height}" src="http://www.youtube.com/embed/#{@id}" frameborder="0" allowfullscreen></iframe>)
      %(<iframe class="youtube-player" type="text/html" src="http://www.youtube.com/embed/#{@id}" frameborder="0" allowfullscreen></iframe>)
    end
  end
end

Liquid::Template.register_tag('youtube', Jekyll::YoutubeTag)