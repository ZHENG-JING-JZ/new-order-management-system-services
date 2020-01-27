class OrderItem < ApplicationRecord
  belongs_to :order
  has_one :product

  monetize :cost_per_item_cents
end
