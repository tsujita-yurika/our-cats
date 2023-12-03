class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.references :member, null: false, foreign_key: true
      t.references :request, null: false, foreign_key: true

      t.timestamps
    end
    add_index :bookmarks, [:member_id, :request_id], unique: :true
  end
end
