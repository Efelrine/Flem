class Owner < ActiveRecord::Base
  has_many :items
  has_and_belongs_to_many :users
  validates :name, uniqueness: true
  has_many :loans
end
