class Owner < ActiveRecord::Base
  has_many :items
  has_and_belongs_to_many :users
  validates :name, uniqueness: true, presence: true
  has_many :loans

  def other_owners
    Owner.where.not(id: id)
  end
end
