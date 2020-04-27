class AddDefaultValueToBylawAndPersonalDataAttributes < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :bylaw, :boolean, default: false
    change_column :orders, :personal_data, :boolean, default: false
  end
end
