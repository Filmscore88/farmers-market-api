class Api::MarketsController < ApplicationController

    def index
      @markets= Market.all
      render json: @markets
    end

    def create
      market= Market.new(market_params)
        render json: market
    end


    def show
      @market= Market.find_by(id: params[:id])
        render json: @market
    end


    def update
      if @market.update(market_params)
        render json: @market, status: 200
      else
        render json: {message: @market.errors}, status: 400
      end
    end


    private

    def market_params
      params.require(:market).permit(
        :name,
        :address,
        :GoogleLink,
        :products,
        :schedule
      )
    end

end
