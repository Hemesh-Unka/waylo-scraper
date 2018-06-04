require 'parse'

describe Parse do
  before(:each) do
    local_html_path = File.join(File.dirname(__FILE__), '/html_test_files', 'cd_p1.html')
    @doc = Nokogiri::HTML(open(local_html_path))
  end

  describe '.all' do
    it 'returns title and prices of items on page' do
      expect(Parse.all(@doc).first).to eq(
        title: '8 Wired Craft Beer Stout single bottle 500ml',
        price: 11.99,
        on_special: false
      )

      # check for product that is on special
      expect(Parse.all(@doc)[2]).to eq(
        title: 'Altitude Brewing Craft Beer Goldpanners Profit single bottle 500ml',
        price: 9.49,
        on_special: true
      )

      expect(Parse.all(@doc).last).to eq(
        title: 'Boundary Road Brewery Lager 330ml Bottles 6pk',
        price: 12.00,
        on_special: false
      )
    end

    it 'returns a item count of 24' do
      expect(Parse.all(@doc).count).to eq(24)
    end
  end
end
