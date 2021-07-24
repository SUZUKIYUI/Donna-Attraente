class ChangeColumnsAddNotnull2OnNotifications < ActiveRecord::Migration[5.2]
  def change
    change_column_null :notifications, :visitedable_id, false
    change_column_null :notifications, :visitedable_type, false
  end
end
