class AddPhoneToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :phone, :integer
  end
end
