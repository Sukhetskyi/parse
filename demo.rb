require 'csv'
require './Parser.rb'
require './Cart.rb'

parser = Parser.new('https://mafia.ua/kiev/menu-dostavki/sushi')

cart = Cart.new()

parser.parse()
cart.save_to_csv()
cart.save_to_json()
