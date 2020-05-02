class ChangeSizeToSizeIdInVariants < ActiveRecord::Migration[6.0]
  def change
    rename_column :variants, :size, :size_id
  end
end
