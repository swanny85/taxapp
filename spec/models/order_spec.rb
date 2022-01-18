require "rails_helper"

RSpec.describe Order, type: :model do
  describe "items with sales tax" do
    before do
      @order = Order.new
      @order.save
      @order_item = @order.order_items.create(
        quantity: 10,
        name: "Pencil",
        price: 1.00,
        sales_tax_exempt: false,
        imported: false
      )
    end

    it "should have a subtotal of $10.00" do
      expect(@order.subtotal).to eq(10.00)
    end

    it "should have a sales tax of $1.00" do
      expect(@order.sales_tax).to eq(1.00)
    end

    it "should have an import tax of $0" do
      expect(@order.import_tax).to eq(0)
    end

    it "should have taxes of $1.00" do
      expect(@order.taxes).to eq(1.00)
    end

    it "should have a total of $11.00" do
      expect(@order.total).to eq(11.00)
    end
  end

  describe "items with import tax" do
    before do
      @order = Order.new
      @order.save
      @order_item = @order.order_items.create(
        quantity: 10,
        name: "Pencil",
        price: 1.00,
        sales_tax_exempt: true,
        imported: true
      )
    end

    it "should have a subtotal of $10.00" do
      expect(@order.subtotal).to eq(10.00)
    end

    it "should have a sales tax of $0" do
      expect(@order.sales_tax).to eq(0)
    end

    it "should have an import tax of $0.50" do
      expect(@order.import_tax).to eq(0.50)
    end

    it "should have taxes of $0.50" do
      expect(@order.taxes).to eq(0.50)
    end

    it "should have a total of $10.50" do
      expect(@order.total).to eq(10.50)
    end
  end

  describe "items without tax" do
    before do
      @order = Order.new
      @order.save
      @order_item = @order.order_items.create(
        quantity: 10,
        name: "Pencil",
        price: 1.00,
        sales_tax_exempt: true,
        imported: false
      )
    end

    it "should have a subtotal of $10.00" do
      expect(@order.subtotal).to eq(10.00)
    end

    it "should have a sales tax of $0" do
      expect(@order.sales_tax).to eq(0)
    end

    it "should have an import tax of $0" do
      expect(@order.import_tax).to eq(0)
    end

    it "should have taxes of $0" do
      expect(@order.taxes).to eq(0)
    end

    it "should have a total of $1.00" do
      expect(@order.total).to eq(10.00)
    end
  end
end
