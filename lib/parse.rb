class Parse
  PRICE_CSS_TAG = '.gridProductStamp-price'
  TITLE_CSS_TAG = '.gridProductStamp-name'
  ON_SPECIAL_CSS_TAG = '.gridProductStamp-productTag img.hidden-phone'

  class << self
    def all(data)
      items = []
      data.css('.gridProductStamp').each do |item|
        items.push(
          title: title(item),
          price: price(item),
          on_special: on_special?(item)
        )
      end
      items
    end

    private

    def title(data)
      data.css(TITLE_CSS_TAG).text.strip
    end

    def price(data)
      data.css(PRICE_CSS_TAG).text.strip.gsub(/[^0-9,.]/, '').to_f
    end

    def on_special?(data)
      return false if data.css(ON_SPECIAL_CSS_TAG)[0].nil?
      data.css(ON_SPECIAL_CSS_TAG)[0].attr('src').include?('/Content/PromotionTags/badge-special.png')
    end
  end
end
