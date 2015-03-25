module ApplicationHelper

  def be_owner(owner)
    if user_signed_in?
      current_user.owners.include?(owner)
    else
      false
    end
  end

  def require_be_owner(owner)
    if user_signed_in?
      if !(current_user.owners.include?(owner))
        flash[:alert] = "You need to be the owner to access this page"
        redirect_to :root
      end
    else
      flash[:alert] = "You need to be the owner to access this page"
      redirect_to :root
    end
  end
end
