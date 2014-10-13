class Loan < ActiveRecord::Base
	belongs_to :item
    belongs_to :owner
    belongs_to :owner, :foreign_key => 'borrower_id'

    after_create do |loan|
    	@item = loan.item
    	if loan.number < @item.number
    		@loans = Loan.where("item_id"=>@item.id, "is_rendered"=>false)
    		if @loans.size > 1
    			all = 0
    			@loans.each do |loanFind|
					all += loanFind
				end
				if all = @item.number
			    	if !@item.update(:is_loaned=>true)
			      		flash[:alert] = "Item not updated. Link between item and loan not created."
			    	end
			    end
			end
		else !@item.update(:is_loaned=>true)
			flash[:alert] = "Item not updated. Link between item and loan not created."
		end
    end
end