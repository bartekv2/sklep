class AddPaymentChannelToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :payment_channel, :integer
  end
end
