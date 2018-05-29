class Parse
  def self.title(data)
    data.css('.gridProductStamp-name').text.strip
  end
end
