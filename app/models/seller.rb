class Seller < ApplicationRecord
  belongs_to :administrator

  validates_presence_of :name, :email, :password
  validates_uniqueness_of :email
  validates_confirmation_of :password
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
end
