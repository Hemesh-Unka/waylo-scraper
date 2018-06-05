class Parse
  PRICE_CSS_TAG = '.gridProductStamp-price'
  TITLE_CSS_TAG = '.gridProductStamp-name'
  ON_SPECIAL_CSS_TAG = '.gridProductStamp-productTag img.hidden-phone'

  class << self
    def all(data)
      loop_through_items(data)
    end

    private

    def loop_through_items(data)
      items(data).map do |i|
        item(i)
      end
    end

    def item(data)
      { title: title(data), price: price(data), on_special: on_special?(data) }
    end

    def items(data)
      data.css('.gridProductStamp')
    end

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
