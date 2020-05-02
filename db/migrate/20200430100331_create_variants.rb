class CreateVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :variants do |t|
      t.string :size
      t.string :color
      t.integer :count
      t.integer :product_id

      t.timestamps
    end
  end
end
