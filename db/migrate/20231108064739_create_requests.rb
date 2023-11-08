class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|

      t.integer :mamber_id, null: false
      t.integer :cat_id, null: false
      t.string :season, null: false
      t.string :days, null: false
      t.string :location, null: false
      t.string :deposit_cat, null: false
      t.string :health_state, null: false
      t.string :memo

      t.timestamps
    end
  end
end
