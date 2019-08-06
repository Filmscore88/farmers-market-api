class User < ApplicationRecord
  has_secure_password

  has_many :fav_markets
  has_many :markets, through: :fav_markets

end
