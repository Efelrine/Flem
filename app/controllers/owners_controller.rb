class OwnersController < ApplicationController
  before_action :require_sign_in
  before_action :set_owner, only: [:show, :edit, :update, :destroy]
  before_action :require_be_link_to_owner, only: [:edit]
  before_action :require_current_user_link, only: [:create, :update]

  # GET /owners
  # GET /owners.json
  def index
    @owners = Owner.all
  end

  # GET /owners/1
  # GET /owners/1.json
  def show
  end

  # GET /owners/new
  def new
    @owner = Owner.new
  end

  # GET /owners/1/edit
  def edit
  end

  # POST /owners
  # POST /owners.json
  def create
    @owner = Owner.new(owner_params)

    respond_to do |format|
      if @owner.save
        format.html do
          if params[:commit] == "Enregistrer et nouveau"
            action = new_owner_path
          else
            action = @owner
          end
          redirect_to action, notice: I18n.t('views.owner.created')
        end
        format.json { render :show, status: :created, location: @owner }
      else
        format.html { render :new }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /owners/1
  # PATCH/PUT /owners/1.json
  def update
    respond_to do |format|
      if @owner.update(owner_params)
        format.html { redirect_to @owner, notice: I18n.t('views.owner.updated') }
        format.json { render :show, status: :ok, location: @owner }
      else
        format.html { render :edit }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owners/1
  # DELETE /owners/1.json
  def destroy
    @owner.destroy
    respond_to do |format|
      format.html { redirect_to owners_url, notice: I18n.t('views.owner.updated') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owner
      if Owner.find_by_id(params[:id].to_i).nil?
        flash[:alert] = I18n.t('views.owner.not_found')
        redirect_to :root
      else
        @owner = Owner.find(params[:id].to_i)
      end
    end

  # Never trust parameters from the scary internet, only allow the white list through.
  def owner_params
    params.require(:owner).permit(:name, :mail, :phone, :user_ids => [])
  end

  def require_be_link_to_owner
    require_be_owner(Owner.find_by_id(params[:id].to_i))
  end

  def require_current_user_link
    if (params[:owner][:user_ids].nil?)
      params[:owner][:user_ids] = [current_user.id]
    else
      params[:owner][:user_ids].push current_user.id
    end
  end
end
