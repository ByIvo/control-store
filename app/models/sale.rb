class Sale < ApplicationRecord
  belongs_to :seller
  belongs_to :customer

  has_many :sale_products

  validates_presence_of :seller, :saleDate, :customer

  def total_price
  	price = 0;

  	sale_products.each do |sale_product|
  		price += sale_product.total_price
  	end

  	price
  end
end
