FactoryBot.define do
  factory :order_item do
    order
    product
    quantity { 5 }
    cost_per_item_cents { 10 }
  end
end