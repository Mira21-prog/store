class AddPriceCharacteristicToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :price, :integer
    add_column :products, :characteristic, :string
    add_column :products, :image, :string
  end
end
