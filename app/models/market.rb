class Market < ApplicationRecord
  has_many :fav_markets
  has_many :users, through: :fav_markets
end
 
