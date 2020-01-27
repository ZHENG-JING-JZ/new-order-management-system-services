class Product < ApplicationRecord
  after_save :create_purchase_order

  def process_order!(quantity)
    raise 'invalid quantity' if quantity > quantity_on_hand
    self.update_attribute :quantity_on_hand, (quantity_on_hand - quantity)
  end

  private

  def create_purchase_order
    while quantity_on_hand < reorder_threshold
      if purchase_from_supplier(reorder_amount)
        self.update_attribute :quantity_on_hand, (quantity_on_hand + reorder_amount)
      end
    end
  end

  # This is a mock method for purchase orders
  def purchase_from_supplier(quantity)
    return true
  end
end
