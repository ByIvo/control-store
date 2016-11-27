json.extract! store, :id, :quantity, :product_id, :isSale, :movementDate, :created_at, :updated_at
json.url store_url(store, format: :json)