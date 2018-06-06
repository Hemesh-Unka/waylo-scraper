require 'nokogiri'

class Scrape
  def self.url(url)
    Nokogiri::HTML(File.open(url))
  end
end
