class Api::UsersController < ApplicationController
  #skip_before_action :authenticate, only: [:create]
  #before_action :set_user, only: [:show, :add_favorite, :delete_favorite, :clear_favorites]


  def create
    user = User.new(name: params["name"], email: params["email"], password: params["password"], fav_markets: [])
      render json: user
  end



  def show
    render json: @user, status: 200
  end


  def add_favorite
    market = Market.find_by_id(market["id"]) || Market.new(market_params)
   if @user.markets.detect{|h| h.id == market.id}
     render json: {text: "You have already favorited this market", type: "error"}, status: 405
   else
     @user.markets << market
     render json: @user.markets, status: 200
   end
 end

  #def delete_favorite
    #deletes @user's favorite hike by id
  #  @user.delete_favorite(params["hike_id"])
  #  render json: @user.hikes, status: 200
  #end

  #def clear_favorites
    #clears all favorites associated to @user
  #  @user.remove_all_favorites
  #  render json: @user.hikes, status: 200
  #end

  private

  #def set_user
  #  @user = @current_user
  #end

  def market_params
    params.require(:market).permit(
      :name,
      :address,
      :GoogleLink,
      :products;
      :schedule
    )
  end


end
