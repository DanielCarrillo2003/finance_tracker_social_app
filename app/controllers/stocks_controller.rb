class StocksController < ApplicationController 
    def search 
        if params[:stock].present? 
            if params[:stock].length <= 5 && params[:stock].length >= 2
                @stock = Stock.new_lookup(params[:stock])
                render 'users/my_portfolio'
            else 
                flash[:alert] = "It seems that the symbol you have entered does not exist, check if you spelled it correctly"
                redirect_to my_portfolio_path
            end
        else 
            flash[:alert] = "Please enter a symbol to search"
            redirect_to my_portfolio_path
        end
    end
    
end