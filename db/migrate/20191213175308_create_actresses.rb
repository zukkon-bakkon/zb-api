class CreateActresses < ActiveRecord::Migration[6.0]
  def change
    create_table :girls do |t|
      t.string :shop_id
      t.string :name
      t.string :bust
      t.string :hip
      t.string :waist
      t.integer :age
      t.integer :height
      t.time :work_time
      t.string :erogenous_zone
      t.text :recommend_message
      t.string :image_url

      t.timestamps
    end
  end
end
