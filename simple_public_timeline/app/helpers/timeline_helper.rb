require 'nokogiri'

module TimelineHelper
  def get_link_text(html_text)
    doc = Nokogiri::HTML::Document.parse(html_text)
    doc.css('a').last.text
  end
end
