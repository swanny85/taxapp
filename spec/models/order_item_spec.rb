require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  before do
    @order = Order.new
    @order.save
  end

  describe 'validations' do
    it 'validates price' do
      order_item = @order.order_items.new(price: nil)
      expect(order_item).to_not be_valid
    end

    it 'validates quantity' do
      order_item = @order.order_items.new(quantity: nil)
      expect(order_item).to_not be_valid
    end

    it 'validates price and quantity' do
      order_item = @order.order_items.new(price: 10.00, quantity: 1)
      expect(order_item).to be_valid
    end
  end
end
