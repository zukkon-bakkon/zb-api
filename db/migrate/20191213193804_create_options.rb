class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options do |t|
      t.integer :girl_id
      t.string :name

      t.timestamps
    end
  end
end
