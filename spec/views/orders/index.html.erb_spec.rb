require "rails_helper"

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        subtotal: "Subtotal",
        tax: "Tax",
        total: "Total"
      ),
      Order.create!(
        subtotal: "Subtotal",
        tax: "Tax",
        total: "Total"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", text: "Subtotal".to_s, count: 2
    assert_select "tr>td", text: "Tax".to_s, count: 2
    assert_select "tr>td", text: "Total".to_s, count: 2
  end
end
