class CreateFavMarkets < ActiveRecord::Migration[5.2]
  def change
    create_table :fav_markets do |t|
      t.integer :market_id
      t.integer :user_id


    end
  end
end
