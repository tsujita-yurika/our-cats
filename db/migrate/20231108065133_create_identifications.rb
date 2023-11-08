class CreateIdentifications < ActiveRecord::Migration[6.1]
  def change
    create_table :identifications do |t|

      t.integer :member_id, null: false
      t.string :name, null: false
      t.string :phone_number, null: false
      t.string :address,null: false

      t.timestamps
    end
  end
end
