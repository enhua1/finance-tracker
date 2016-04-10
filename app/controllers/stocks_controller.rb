class StocksController < ApplicationController

def search
  if params[:stock] 
    @stock = Stock.find_by_ticker(params[:stock]) #method established in models
    @stock ||= Stock.new_from_lookup(params[:stock]) #if we have looked up, not existing in database
    #this is an optimisation 
  end

  if @stock
    #render json: @stock
    render partial: 'lookup'
  else
    render status: :not_found, nothing: true
  end

end

end