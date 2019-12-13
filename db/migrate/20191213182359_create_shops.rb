class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :shop_url
      t.string :open_time
      t.integer :price
      t.string :tell_number
      t.string :description
      t.string :title
      t.string :trip_area
      t.string :holiday
      t.integer :admission
      t.integer :designation_fee
      t.integer :trans_fee
      t.string :payment
      t.string :image_url

      t.timestamps
    end
  end
end
