require 'scrape'

describe Scrape do
  describe '.url' do
    it 'takes a url and returns a nokogiri object' do
      expect(Scrape).to receive(:open).with('http://www.test.com')
      expect(Nokogiri::HTML::Document).to receive(:parse)

      Scrape.url('http://www.test.com')
    end
  end
end
