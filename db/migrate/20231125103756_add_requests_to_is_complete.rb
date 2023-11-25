class AddRequestsToIsComplete < ActiveRecord::Migration[6.1]
  def change
    add_column :requests, :is_complete, :boolean, null: false, default: false
  end
end
