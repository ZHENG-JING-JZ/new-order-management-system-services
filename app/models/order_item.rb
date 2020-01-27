class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :product_id, presence: true
  validates :order_id, presence: true
  validates :cost_per_item_cents, presence: true

  monetize :cost_per_item_cents
end
