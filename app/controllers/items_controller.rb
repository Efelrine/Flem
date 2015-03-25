class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :require_be_owner_item, only: [:edit]
  before_filter :id_owner_default, only: [:new, :edit]
  before_filter :get_param_owner, only: [:new, :edit]
  before_filter :owners_by_user, only: [:new, :edit]

  # GET /items
  # GET /items.json
  def index
    @items = Item.where("is_loanable" => true)
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  # GET /owners/1/items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  # GET /owners/1/items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
        format.html do
          if params[:commit] == "Enregistrer et nouveau"
            action = go_to_new_action
          else
            action = go_to_owner_action
          end
          redirect_to action, notice: 'Item was successfully created.'
        end
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html do
          redirect_to go_to_owner_action, notice: 'Item was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def go_to_owner_action
    if @param_owner.nil?
      items_url
    else
      personal_items_url(@param_owner)
    end
  end

  def go_to_new_action
    if @param_owner.nil?
      new_item_path
    else
      new_item_path_url(@param_owner)
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html do
        redirect_to go_to_owner_action, notice: 'Item was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      if(Item.find_by_id(params[:id].to_i).nil?)
        flash[:alert] = "Item not found"
        redirect_to :root
      else
        @item = Item.find(params[:id].to_i)
      end
    end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:name,:number, :owner_id, :is_loanable, :comment, :price, :is_lost, :location)
  end

  def require_be_owner_item
    require_be_owner(Item.find(params[:id].to_i).owner))
  end

  def id_owner_default
    if @item.nil?
      if params[:owner_id].nil?
        @id_owner_default = current_user.owners.find_by(:is_primary => true).id
      else
        @id_owner_default = params[:owner_id]
      end
    else
      @id_owner_default = @item.owner.id
    end
  end
  
  def get_param_owner
    @param_owner = Owner.find_by_id(params[:owner_id])
  end

  def owners_by_user
    if user_signed_in?
      @owners_by_user = current_user.owners
    end
  end
end
