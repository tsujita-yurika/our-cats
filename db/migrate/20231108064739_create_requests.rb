class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|

      t.integer :member_id, null: false
      t.string :season, null: false
      t.integer :days, null: false
      t.string :location, null: false
      t.string :memo

      t.timestamps
    end
  end
end
