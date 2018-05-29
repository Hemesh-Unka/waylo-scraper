class Parse
  def self.all(data)
    data.css('.gridProductStamp')
  end

  def self.title(data)
    data.css('.gridProductStamp-name').text.strip
  end

  def self.price(data)
    data.css('.gridProductStamp-price').text.strip.gsub(/[^0-9,.]/, '').to_f
  end
end
