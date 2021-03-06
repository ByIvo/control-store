class Product < ApplicationRecord
  validates_presence_of :name, :price

  validates_numericality_of :price, :greater_than => 0
end
