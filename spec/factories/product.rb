FactoryBot.define do
  factory :product do
    description { "test product" }
    quantity_on_hand  { 10 }
    reorder_threshold { 10 }
    reorder_amount { 20 }
    delivery_lead_time { 20 }
  end
end