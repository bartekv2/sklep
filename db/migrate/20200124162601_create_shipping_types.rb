class CreateShippingTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_types do |t|
      t.string :name
      t.decimal :cost

      t.timestamps null: false
    end
  end
end
