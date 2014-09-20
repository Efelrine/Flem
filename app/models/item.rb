class Item < ActiveRecord::Base
	belongs_to :owner, presence: true
	validates :name, presence: true
end
