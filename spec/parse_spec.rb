require 'parse'

describe Parse do
  before(:each) do
    local_html_path = File.join(File.dirname(__FILE__), '/html_test_files', 'cd_p1.html')
    @doc = Nokogiri::HTML(open(local_html_path))
  end

  describe '.title' do
    it 'returns the title of the first product' do
      expect(Parse.title(@doc)).to include('8 Wired Craft Beer Stout single bottle 500ml')
    end

    it 'returns the title of the last product' do
      expect(Parse.title(@doc)).to include('Boundary Road Brewery Lager 330ml Bottles 6pk')
    end
  end
end
