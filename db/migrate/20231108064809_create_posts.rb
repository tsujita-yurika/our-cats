class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :member_id, null: false
      t.text :post_content, null: false

      t.timestamps
    end
  end
end
