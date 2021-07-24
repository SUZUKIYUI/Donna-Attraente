class AddColumnsNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :visitedable_id, :bigint
    add_column :notifications, :visitedable_type, :string
  end
end
