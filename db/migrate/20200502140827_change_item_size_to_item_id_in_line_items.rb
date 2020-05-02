class ChangeItemSizeToItemIdInLineItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :line_items, :item_size, :variant_id
  end
end
