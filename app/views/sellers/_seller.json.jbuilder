json.extract! seller, :id, :name, :email, :password, :administrator_id, :created_at, :updated_at
json.url seller_url(seller, format: :json)