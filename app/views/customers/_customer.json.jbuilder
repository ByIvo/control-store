json.extract! customer, :id, :name, :phone, :cellphone, :address, :created_at, :updated_at
json.url customer_url(customer, format: :json)