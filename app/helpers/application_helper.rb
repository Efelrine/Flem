module ApplicationHelper

  def be_owner(owner)
    if user_signed_in?
      current_user.owners.include?(owner)
    else
      false
    end
  end

  def get_owners
    if user_signed_in?
      current_user.owners
    end
  end
  
end
