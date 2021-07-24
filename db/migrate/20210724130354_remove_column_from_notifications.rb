class RemoveColumnFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :visited_user_id, :integer
    remove_column :notifications, :visited_user_type, :string
  end
end
