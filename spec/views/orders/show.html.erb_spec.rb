require "rails_helper"

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Subtotal/)
    expect(rendered).to match(/Tax/)
    expect(rendered).to match(/Total/)
  end
end
