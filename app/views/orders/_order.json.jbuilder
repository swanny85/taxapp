json.extract! order, :id, :subtotal, :tax, :total, :created_at, :updated_at
json.url order_url(order, format: :json)
