class AddPersonalDataToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :personal_data, :boolean
  end
end
