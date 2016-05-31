class Seller < ActiveRecord::Base
	validates_presence_of :name
	has_many :houses, dependent: :destroy
end
