class Customer < ApplicationRecord
	validates_presence_of :name, :phone, :cellphone, :address
end
