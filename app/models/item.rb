class Item < ActiveRecord::Base
  belongs_to :owner
  validates :name, presence: true
  has_many :loans
end
