class Order < ApplicationRecord
  # More status to be added in practical cases
  enum status: ['Pending', 'Fulfilled', 'Error: Unfulfillable']
  has_many :order_items

  def fulfil
    return false unless order.fulfillable?
    self.transaction do
      order_items.each do |item|
        item.product.process_order!(item.quantity)
      rescue
        next
      end
    end
    self.update_attribute! :status, 'Fulfilled'
    return true
  rescue Exception => e
    return false
  end

  def fulfillable?
    order_items.each do |item|
      return false if item.quantity > item.product.quantity_on_hand
    end
    true
  end
end
