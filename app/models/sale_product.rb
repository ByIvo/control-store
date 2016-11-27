class SaleProduct < ApplicationRecord
  belongs_to :sale
  belongs_to :product
  belongs_to :store

  validates_presence_of :sale, :product, :store, :price

  def total_price
  	price * store.quantity
  end

end
