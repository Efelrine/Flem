class Item < ActiveRecord::Base
  belongs_to :owner
  validates :name, presence: true
  has_many :loans

  def number_available
    @numberDispo = number
    @loans = Loan.where("item_id" => id, "is_rendered" => false)
    @loans.each do |loanToDown|
      @numberDispo -= loanToDown.number
    end
    @numberDispo
  end
end
