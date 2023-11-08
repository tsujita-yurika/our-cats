class CreateDepositCats < ActiveRecord::Migration[6.1]
  def change
    create_table :deposit_cats do |t|

      t.integer :request_id, null: false
      t.string :name, null: false
      t.string :health_state, null: false
      t.integer :age, null: false
      t.string :sex, null: false
      t.string :category, null: false
      t.string :family

      t.timestamps
    end
  end
end
