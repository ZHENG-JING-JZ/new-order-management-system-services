class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :description
      t.integer :quantity_on_hand
      t.integer :reorder_threshold
      t.integer :reorder_amount
      t.integer :delivery_lead_time
      t.timestamps
    end
  end
end
