class Order < ApplicationRecord
  has_many :order_items
  accepts_nested_attributes_for :order_items, reject_if: :all_blank, allow_destroy: true

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.price) : 0 }.sum
  end

  def sales_tax
    order_items.collect { |oi| oi.sales_tax_exempt? ?  0 : ((oi.quantity * oi.price * 0.1) * 20).ceil / 20.0 }.sum
  end

  def import_tax
    order_items.collect { |oi| !oi.imported? ?  0 : (oi.quantity * oi.price * 0.05) }.sum.truncate(2)
  end

  def taxes
    sales_tax + import_tax
  end

  def total
    subtotal + taxes
  end
end
