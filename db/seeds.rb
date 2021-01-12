# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ["iPhone", "MacBook", "AppleWatch", "iPad",
#  "Mac", "Apple Headphones", "Apple accessories",
#   "Wireless equipment", "Input Devices", "Apple TV", "iPod"].each do |name|
#   	category = Category.create(name: name)
#   	category_data[name.to_sym].each do |sub_name|
#   		sub_category = category.subcategories.create(name: sub_name)
#   		  Product.create(name: ,category_id: sub_category.id , price: , characteristic:, image:)
#   	end
#   end 

# category_data = {iPhone: {"iPhone 12" => {"Smartphone Apple iPhone 12 64GB Product Red (MGJ73 / MGH83)"=>{}}, "iPhone 12 Pro", "iPhone 12 Pro Max", "iPhone 12 Mini",
#  "iPhone SE 2020", "iPhone 11 Pro Max", "iPhone 11 Pro", "iPhone 11", "iPhone XS Max"},
#  MacBook: ["MacBook 12", "MacBook Pro", "MacBook Air", "MacBook Custom"], 
#  AppleWatch: ["Series 6", "Watch SE", "Series 5", "Nike+ Series 5", "Series 4", "Nike+ Series 4"
#   "Hermes Series 4", "Series 3", "Nike+ Series 3", "Series 2", "Nike+ Series 2", 
# 	"Edition Series 2", "Series 1 Nike+", "Sport", "Watch", "Nike+ Watch SE", 
# 	"Nike+ Series 6"], 
#  iPad: ["iPad Air 2020","iPad 10,2 2020","iPad Pro 11 2020","iPad Pro 12,9 2020","iPad Air 10,5 2019",
#  "iPad 10,2 2019","iPad mini 5 2019","iPad Pro 11 2018""iPad Pro 12,9 2018"],
#  Mac:["iMac", "MacMini", "Mac Pro"], 
#  "Apple Headphones" => ["Apple AirPods"],
#  "Apple accessories"=>["IPhone 12 Pro Max Accessories","IPhone 12 Pro Max Accessories", "IPhone 12/12 Pro Accessories",
#  "IPhone 12/12 Pro Accessories", "IPhone 12 Mini Accessories", "IPhone 12 Mini Accessories",
#  "IPhone 11 Pro Max Accessories", "IPhone 11 Pro Max Accessories", "IPhone 11 Pro Accessories"] ,
#  "Wireless equipment"=> ["Apple AirPort"], "Input Devices"=>["Apple Magic Keyboard", "Apple Pencil", "Apple Magic Mouse"], 
#  "Apple TV"=>["Apple TV 4K", "Apple TV 3G"], "iPod"=>["iPod Shuffle", "iPod Touch"]
# }
require 'csv'

csv_data = File.read("#{Rails.root.join('db/products.csv')}")

csv = CSV.new(csv_data, :headers => true, :header_converters => :symbol, :converters => :all)

products_data = csv.to_a.map { |row| row.to_hash }

products_data.each do |item|
	category = Category.where(name: item[:category]).first_or_create!

	subcategory = category.subcategories.where(parent_id: category.id, name: item[:subcategory]).first_or_create!
	subcategory.products.create(name: item[:product], price: item[:price], image: item[:image], characteristic:item[:characteristic] )
end