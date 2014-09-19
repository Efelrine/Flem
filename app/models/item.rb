class Item < ActiveRecord::Base
	belongs_to :owner
	validates :name, presence: true
end
