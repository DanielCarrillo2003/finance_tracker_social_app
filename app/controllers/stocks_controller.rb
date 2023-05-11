class StocksController < ApplicationController 
    protect_from_forgery except: :search

    def search 
        if params[:stock].present? 
            if params[:stock].length <= 5 && params[:stock].length >= 2
                @stock = Stock.new_lookup(params[:stock]) 
                if @stock 
                    respond_to do |format|
                        format.js {render partial: 'users/result'}
                    end
                end
            else 
                respond_to do |format|
                flash.now[:alert] = "It seems that the symbol you have entered does not exist, check if you spelled it correctly"
                format.js {render partial: 'users/result'}
                end
            end
        else 
            respond_to do |format|
                flash.now[:alert] = "Please enter a symbol to search"
                format.js {render partial: 'users/result'}
                end
        end
    end
    
end