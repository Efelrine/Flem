module OwnersHelper

  def can_be_deleted
    owner = Owner.find_by_id(params[:id].to_i)
    if be_owner(owner) & owner.items.nil?
      true
    else
      false
    end
  end
end
