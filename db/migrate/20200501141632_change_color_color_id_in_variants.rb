class ChangeColorColorIdInVariants < ActiveRecord::Migration[6.0]
  def change
    rename_column :variants, :color, :color_id
  end
end
