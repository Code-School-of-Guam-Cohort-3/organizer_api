class AddAssignedUserIdToTasks < ActiveRecord::Migration[8.1]
  def change
    add_column :tasks, :assigned_user_id, :integer
  end
end
