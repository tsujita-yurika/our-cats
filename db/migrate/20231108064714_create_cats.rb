class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|

      t.integer :member_id, null: false
      t.string :name, null: false
      t.string :sex, null: false
      t.integer :age, null: false
      t.string :category, null: false
      t.string :family

      t.timestamps
    end
  end
end
