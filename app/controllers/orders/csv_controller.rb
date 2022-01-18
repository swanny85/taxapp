class Orders::CsvController < ApplicationController
  before_action :set_order

  def show
    respond_to do |format|
      format.csv { send_data @order.csv_output, filename: "order-#{@order.id}.csv" }
    end
  end

  private

    def set_order
      @order = Order.find(params[:id])
    end
end
