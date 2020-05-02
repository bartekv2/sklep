class Variant < ApplicationRecord
  belongs_to :product
  belongs_to :size
  belongs_to :color

  validates :size, presence: true
  validates :color, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0.0 }
  validates :product_id, presence: true
end
