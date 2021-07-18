class ChangeDesignContributorIdColumnOnNotifications < ActiveRecord::Migration[5.2]
  def change
    change_column_null :notifications, :design_contributor_id, false
  end
end
