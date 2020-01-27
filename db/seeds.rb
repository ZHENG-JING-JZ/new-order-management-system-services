# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# create a sample api client to use
APIClient.create! name: 'test user', token: 'rZvDngfZIHPrU8yZLpcb'

# load data from the given file

file = File.open 'db/data.json'
json = JSON.load file

json["products"].each do |product|
  Product.create! id: product["productId"],
                  description: product["description"],
                  quantity_on_hand: product["quantityOnHand"],
                  reorder_threshold: product["reorderThreshold"],
                  reorder_amount: product["reorderAmount"],
                  delivery_lead_time: product["deliveryLeadTime"]
end

json["orders"].each do |order|
  Order.create! id: order["orderId"],
                status: order["status"],
                created_at: DateTime.parse(order["dateCreated"])

  order["items"].each do |item|
    OrderItem.create! order_id: item["orderId"],
                      product_id: item["productId"],
                      quantity: item["quantity"],
                      cost_per_item_cents: item["costPerItem"]*100
  end
end
