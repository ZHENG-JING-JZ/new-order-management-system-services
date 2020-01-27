require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'fulfil' do
    before(:each) do
      @order1 = create(:order)
      create(:order_item, order: @order1, quantity: 100)

      @product1 = create(:product, quantity_on_hand: 20)
      @product2 = create(:product, quantity_on_hand: 20)
      @order2 = create(:order)
      create(:order_item, order: @order2, product: @product1, quantity: 2)
    end

    it 'should return false when not fulfillable' do
      expect(@order1.fulfil).to be false
    end

    it 'should return true and update order status' do
      expect(@order2.status).to eq 'Pending'
      expect(@order2.fulfil).to be true
      expect(@order2.status).to eq 'Fulfilled'
    end

    it 'should rollback the transaction' do
      create(:order_item, order: @order2, product: @product2, quantity: 100)
      allow(@order2).to receive(:fulfillable?).and_return(true)
      expect(@order2.fulfil).to be false
      expect(@product1.quantity_on_hand).to eq 20
    end
  end
end
