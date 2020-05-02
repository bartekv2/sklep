class AddItemSizeToLineItems < ActiveRecord::Migration[6.0]
  def change
    add_column :line_items, :item_size, :string
  end
end
