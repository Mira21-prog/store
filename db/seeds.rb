require 'csv'

csv_data = File.read(Rails.root.join('db/products.csv').to_s)

csv = CSV.new(csv_data, headers: true, header_converters: :symbol, converters: :all)

products_data = csv.to_a.map { |row| row.to_hash }

products_data.each do |item|
  category = Category.where(name: item[:category]).first_or_create!

  subcategory = category.subcategories.where(parent_id: category.id, name: item[:subcategory]).first_or_create!
  subcategory.products.create(name: item[:product], price: item[:price],
                              characteristic: item[:characteristic])
end
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end
