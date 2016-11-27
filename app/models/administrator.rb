class Administrator < ApplicationRecord

	validates_presence_of :name, :email, :password
	validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

	validates_confirmation_of :password
	validates_uniqueness_of :email
end
