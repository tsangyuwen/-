class RenameRoleFromUser < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :role, :integer
    rename_column :users, :role, :role_id
  end
end
