require 'scrape'

describe Scrape do
  describe '.url' do
    it 'responds to a url' do
      expect(Scrape).to receive(:url).with('http://www.test.com')
      Scrape.url('http://www.test.com')
    end
  end
end
