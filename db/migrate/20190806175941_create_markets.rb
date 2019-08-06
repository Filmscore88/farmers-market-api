class CreateMarkets < ActiveRecord::Migration[5.2]
  def change
    create_table :markets do |t|
      t.string :name
      t.string :address
      t.string :GoogleLink
      t.string :products
      t.string :schedule

      t.timestamps
    end
  end
end
