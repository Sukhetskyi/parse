require 'open-uri'
require 'byebug'
require 'nokogiri'
require 'csv'
require 'json'
require './Sushi.rb'
require './Item.rb'

class Cart

    def save_to_csv()
        path_csv = './sushi.csv'
        sushi = Sushi.get_All()
        begin  
            File.new(path_csv, "w")
            
            CSV.open(path_csv, "w", headers: ['Id', 'Name', 'Price', 'Description'], write_headers: true) do |csv|
                sushi.each do |product|
                    csv << [product.id, product.name, product.price, product.description]
                end
            end

            puts "Успішно записано у файл csv"
        rescue StandardError => e
            puts e.message
            puts "Не вдається відкрити файл csv для запису"
        end

    def save_to_json()
        path_json = './sushi.json'
        sushi = Sushi.get_All()

        begin 
            File.new(path_json, "w")

            File.open(path_json, "w") do |json|
                sushi.each do |product|
                    temp_hash = {
                        "Id" => product.id,
                        "Name" => product.name,
                        "Price" => product.price,
                        "Description" => product.description
                    }

                    json.write(JSON.pretty_generate(temp_hash))
                end
            end
        end


            puts "Успішно записано у файл json"
        rescue StandardError => e
            puts e.message
            puts "Неможливо відкрити файл json для запису"
        end
    end
end