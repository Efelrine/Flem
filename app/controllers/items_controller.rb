class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :require_be_owner, only: [:index_owner]
  before_action :require_be_owner_item, only: [:edit]

  # GET /items
  # GET /items.json
  def index
    @items = Item.where("is_loanable" => true)
  end

  # GET /owners/1/items
  # GET /owners/1/items.json
  def index_owner
    if Owner.find_by_id(params[:id]).nil?
      flash[:alert] = "Owner not found"
      redirect_to :root
    else
      @concern_owner = Owner.find(params[:id])
      @items = @concern_owner.items
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
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
            action = new_item_path
          else
            action = items_url
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
        format.html { redirect_to items_url, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_after_loan loan
    @item = loan.item
    @item.is_loaned = true
    if !@item.update(item_params)
      flash[:alert] = "Item not updated. Link between item and loan not created."
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      if(Item.find_by_id(params[:id]).nil?)
        flash[:alert] = "Item not found"
        redirect_to :root
      else
        @item = Item.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name,:number, :owner_id, :is_loanable, :comment, :price, :is_lost, :location)
    end
end
