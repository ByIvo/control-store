json.extract! sale, :id, :seller_id, :customer_id, :saleDate, :created_at, :updated_at
json.url sale_url(sale, format: :json)