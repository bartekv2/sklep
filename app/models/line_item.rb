class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :variant_id, presence: true

  def full_price
    unit_price * quantity
  end
end
