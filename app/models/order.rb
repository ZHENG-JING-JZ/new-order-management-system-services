class Order < ApplicationRecord
  # More status to be added in practical cases
  enum status: ['Pending', 'Processed', 'Error: Unfulfillable']
  has_many :order_items
end
