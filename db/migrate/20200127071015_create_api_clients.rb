class CreateAPIClients < ActiveRecord::Migration[6.0]
  def change
    create_table :api_clients do |t|
      # name is for displaying purpose.
      # I'm only setting up a simple token auth method for api consumers.
      t.string :name
      t.string :token
      t.timestamps
    end
  end
end
