require 'scrape'
require 'open-uri'

describe Scrape do
  describe '.url' do
    it 'takes a url' do
      expect(Scrape).to receive(:open).with('http://www.test.com')

      Scrape.url('http://www.test.com')
    end

    it 'nokogiri gets called and returns a nokogirl object' do
      expect(Nokogiri::HTML::Document).to receive(:parse)

      Scrape.url('http://www.test.com')
    end
  end
end
