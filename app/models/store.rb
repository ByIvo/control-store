class Store < ApplicationRecord
  belongs_to :product

  validates_presence_of :isSale, :product, :quantity, :movementDate
end
