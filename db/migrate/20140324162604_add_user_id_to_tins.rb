class AddUserIdToTins < ActiveRecord::Migration
  def change
    add_column :tins, :user_id, :integer
    add_index :tins, :user_id
  end
end
