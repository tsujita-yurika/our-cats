class CreateDepositCats < ActiveRecord::Migration[6.1]
  def change
    create_table :deposit_cats do |t|

      t.integer :cat_id, null: false
      t.integer :request_id, null: false

      t.timestamps
    end
  end
end
