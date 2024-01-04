require 'open-uri'
require 'byebug'
require 'nokogiri'
require './Sushi.rb'
require './Item.rb'

class Parser

    def initialize(url)
        @url = url
    end

    def parse()
        begin
          html = URI.open(@url) { |result| result.read }
          doc = Nokogiri::HTML(html)
          i = 0
      
          doc.css('.product-item').each do |element| 
            sushi = Item.new()
            sushi.name = element.css(".product-title").text.strip rescue nil
            sushi.description = element.css(".product-description").text.strip rescue nil
            sushi.price = element.css(".price-value").text.split(" ")[0]
            sushi.id = i + 1
            i += 1
            Sushi.set_item(sushi)
          end
       
        rescue OpenURI::HTTPError => e
          puts e.message
        end
       end
       
end
