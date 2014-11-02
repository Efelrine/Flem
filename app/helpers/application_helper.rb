module ApplicationHelper

  def be_owner(owner)
    if user_signed_in?
      current_user.owners.include?(owner)
    else
      false
    end
  end

  def get_owners_user
    if user_signed_in?
      current_user.owners
    end
  end

  def get_users
    User.all
  end

  def get_owner owner_id
    Owner.find_by_id(owner_id)
  end

  def get_owners_less_current
    Owner.all
  end
  
  def item_number_available item
    @numberDispo = item.number
    @loans = Loan.where("item_id" => item.id, "is_rendered" => false)
    @loans.each do |loanToDown|
      @numberDispo =- loanToDown.number
    end
  end
end
