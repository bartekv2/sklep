class ChangeDefaultValueInBylawAndPersonalDataAttributes < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :bylaw, :boolean, default: true
    change_column :orders, :personal_data, :boolean, default: true
  end
end
