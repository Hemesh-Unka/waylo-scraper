require 'parse'

describe Parse do
  before(:each) do
    local_html_path = File.join(File.dirname(__FILE__), '/html_test_files', 'cd_p1.html')
    @doc = Nokogiri::HTML(open(local_html_path))
  end

  describe '.all' do
    it 'returns all the products on the page' do
      expect(Parse.all(@doc).count).to eq(24)
    end

    it 'returns the first title' do
      expect(Parse.title(Parse.all(@doc).first)).to eq('8 Wired Craft Beer Stout single bottle 500ml')
    end

    it 'returns the title of the last product' do
      expect(Parse.title(Parse.all(@doc).last)).to eq('Boundary Road Brewery Lager 330ml Bottles 6pk')
    end

    it 'returns the price of the first product' do
      expect(Parse.price(Parse.all(@doc).first)).to eq(11.99)
    end

    it 'returns the price of the last product' do
      expect(Parse.price(Parse.all(@doc).last)).to eq(12.00)
    end
  end
end
