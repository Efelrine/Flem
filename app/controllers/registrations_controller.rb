class RegistrationsController < Devise::RegistrationsController
  prepend_view_path "app/views/devise"

  def create
    super
    # Generate your profile here
    # ...
    if @user.save 
      owner = Owner.create
      owner.name = @user.name
      owner.phone =  @user.phone
      owner.mail = @user.email
      owner.is_primary = true
      @user.owners << owner
      owner.save
    end
  end

  def update
    super
    if @user.save 
      owner = @user.owners.find_by(:is_primary => true)
      owner.name = @user.name
      owner.phone =  @user.phone
      owner.mail = @user.email
      owner.save
    end
  end
end