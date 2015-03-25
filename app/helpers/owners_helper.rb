module OwnersHelper

  def can_be_deleted(owner)
    if be_owner(owner) & owner.items.empty?
      true
    else
      false
    end
  end
end
