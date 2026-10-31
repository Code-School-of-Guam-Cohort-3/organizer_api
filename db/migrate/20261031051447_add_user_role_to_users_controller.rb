class AddUserRoleToUsersController < ActiveRecord::Migration[8.1]
  def change
    # Adds user_role attribute
    add_column :users, :user_role, :string
  end
end
