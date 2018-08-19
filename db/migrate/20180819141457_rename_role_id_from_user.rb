class RenameRoleIdFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :role_id
    add_column :users, :role, :string, default: "normal"
  end
end
