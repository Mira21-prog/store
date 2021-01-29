class AddNameAndEmailToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :name, :string
    add_column :orders, :email, :string
  end
end
