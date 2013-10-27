module CustomHelpers
  def figure_tag(src, args)
    caption = ""
    unless args[:title].nil?
      args[:alt] = args[:title]
      caption = "<div class=\"caption\">#{args[:title]}</div>"
    end
    buffer = image_tag(src, args)
    "<div class=\"thumbnail\" style=\"max-width:#{args[:width].to_i+10}px\" markdown=\"0\">#{buffer}#{caption}</div>\n"
  end
  
  def webcomic
    png = "webcomic/#{data.page.png}"
    svg = "webcomic/#{data.page.svg}"
    out = figure_tag png,  title: data.page.subtitle
    if svg
      out += link_to 'SVG from Inkscape', svg
    end
    if data.page.license == 'cc-by-nc-sa'
      out += link_to (image_tag 'by-nc-sa.eu.png', title: "Creative Commons Attribution-NonCommercial-ShareAlike 2.0 Generic"), "//creativecommons.org/licenses/by-nc-sa/2.0/", title: "Creative Commons Attribution-NonCommercial-ShareAlike 2.0 Generic"
    end
    out
  end
  
  def site_url
    '//' + settings.host
  end
end