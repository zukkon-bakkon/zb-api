class CreateActresses < ActiveRecord::Migration[6.0]
  def change
    create_table :girls do |t|
      t.string :shop_id
      t.string :name
      t.integer :bust
      t.integer :hip
      t.integer :waist
      t.string :cup
      t.integer :age
      t.integer :height
      t.time :work_time
      t.string :eroginous_zone
      t.text :recommend_message

      t.timestamps
    end
  end
end
