class ChangeTypeForPhoneInAddresses < ActiveRecord::Migration[6.0]
  def change
    change_column :addresses, :phone, :string
  end
end
