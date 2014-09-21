class RegistrationsController < Devise::RegistrationsController
  prepend_view_path "app/views/devise"

  def create
    super
    # Generate your profile here
    # ...
    owner = Owner.create
    owner.name = @user.name
    owner.phone =  @user.phone
    @user.owners << owner
    owner.save
  end

  def update
    super
  end
end