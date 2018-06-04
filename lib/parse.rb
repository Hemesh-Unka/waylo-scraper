class Parse
  class << self
    def all(data)
      items = []
      data.css('.gridProductStamp').each do |item|
        items.push(
          title: title(item),
          price: price(item)
        )
      end
      items
    end

    private

    def title(data)
      data.css('.gridProductStamp-name').text.strip
    end

    def price(data)
      data.css('.gridProductStamp-price').text.strip.gsub(/[^0-9,.]/, '').to_f
    end
  end
end
