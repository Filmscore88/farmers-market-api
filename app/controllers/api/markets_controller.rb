class Api::MarketsController < ApplicationController

    def index
      render json: Market.all
    end

    def create
      market= Market.new(market_params)
      if market.save 
        render json:market
      end
    end


    def show
      @market= Market.find_by(id: params[:id])
      if @market
        render json: @market
      else
        render json: { message: user.errors}, status:400
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
