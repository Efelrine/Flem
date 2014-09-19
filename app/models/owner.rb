class Owner < ActiveRecord::Base
	has_many :items
end
