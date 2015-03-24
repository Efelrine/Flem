class Item < ActiveRecord::Base
  belongs_to :owner
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
