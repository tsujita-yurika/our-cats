class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|

      t.integer :member_id
      t.integer :category_id
      t.string :name, null: false
      t.string :sex, null: false
      t.string :age, null: false
      t.string :family
      t.text :introduction

      t.timestamps
    end
  end
end
