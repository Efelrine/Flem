class LoansController < ApplicationController
  before_action :require_sign_in
  before_action :set_loan, only: [:show, :edit, :update]
  before_action :require_be_owner_loan, only: [:edit]

  # GET /items/1/loans/new
  def new
  	@item = Item.find_by_id(params[:id])
  	if @item.nil?
  	  flash[:alert] = "Item not found"
      redirect_to :root
  	else
	  @loan = Loan.new
	  @loan.item = @item
	  @loan.owner = @item.owner
	end
  end

  # GET /loans/1
  # GET /loans/1.json
  def show
  end

  # POST /loans/1
  # POST /loans/1.json 
  def create
    @loan = Loan.new(loan_params)

    respond_to do |format|
      if @loan.save
      	@item = @loan.item
        format.html { redirect_to @item, notice: 'Loan succesfully created.' }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render :new }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_loan
    if(Loan.find_by_id(params[:id]).nil?)
      flash[:alert] = "Loan not found"
      redirect_to :root
    else
      @loan = Loan.find(params[:id])
    end
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def loan_params
    params.require(:loan).permit(:number, :date_loan, :state, :is_rendered, :borrower_id, :item_id, :owner_id)
  end
end
