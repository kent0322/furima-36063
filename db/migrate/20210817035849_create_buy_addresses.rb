class CreateBuyAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :buy_addresses do |t|
      t.string     :post,              nill: false
      t.string     :city,              nill: false
      t.string     :address,           nill: false
      t.string     :building
      t.string     :telephone,         nill: false
      t.integer    :area_id,           nill: false 
      t.references :purchase,          null: false, foreign_key: true
      t.timestamps
    end
  end
end





