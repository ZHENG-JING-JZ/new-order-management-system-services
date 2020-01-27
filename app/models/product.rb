class Product < ApplicationRecord
  def process_order!(quantity)
    raise 'invalid quantity' if quantity > quantity_on_hand
    self.update_attribute :quantity_on_hand, (quantity_on_hand - quantity)
  end
end
