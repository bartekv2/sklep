class ChangeCountToQuantityInVariants < ActiveRecord::Migration[6.0]
  def change
    rename_column :variants, :count, :quantity
  end
end
