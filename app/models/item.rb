class Item < ActiveRecord::Base
  belongs_to :owner
  belongs_to :category
  belongs_to :item_status
  validates :name, presence: true
  has_many :loans

  def number_available
    available = number
    @loans = Loan.where("item_id" => id, "is_rendered" => false)
    @loans.each do |loanToDown|
      available -= loanToDown.number
    end
    available
  end
end
