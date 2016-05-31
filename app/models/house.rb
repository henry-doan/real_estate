class House < ActiveRecord::Base
	belongs_to :seller, dependent: :destroy
end
