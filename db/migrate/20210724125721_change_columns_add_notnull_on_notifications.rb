class ChangeColumnsAddNotnullOnNotifications < ActiveRecord::Migration[5.2]
  def change
    change_column_null :notifications, :visitor_id, false
  end
end
