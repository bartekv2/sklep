class ChangeTypeOdVariantId < ActiveRecord::Migration[6.0]
  def change
    change_column :line_items, :variant_id, 'integer USING CAST(variant_id AS integer)'
  end
end
