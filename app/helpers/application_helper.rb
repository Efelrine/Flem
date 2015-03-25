module ApplicationHelper

  def be_owner(owner)
    if user_signed_in?
      current_user.owners.include?(owner)
    else
      false
    end
  end
end
