require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'process_order!' do
    before(:all) do
      @product1 = create(:product)
      @product2 = create(:product, quantity_on_hand: 50)
    end

    it 'should fail to process' do
      expect { @product1.process_order!(20) }.to raise_error('invalid quantity')
    end

    it 'should update stock' do
      expect { @product2.process_order!(5) }.to change { @product2.quantity_on_hand }.from(50).to(45)
    end

    it 'should create purchase and update stock' do
      expect { @product1.process_order!(5) }.to change { @product1.quantity_on_hand }.from(10).to(25)
    end
  end
end
