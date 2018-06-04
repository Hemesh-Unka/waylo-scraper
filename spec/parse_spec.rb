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
        price: 11.99
      )

      expect(Parse.all(@doc).last).to eq(
        title: 'Boundary Road Brewery Lager 330ml Bottles 6pk',
        price: 12.00
      )
    end

    it 'returns a item count of 24' do
      expect(Parse.all(@doc).count).to eq(24)
    end
  end
end
