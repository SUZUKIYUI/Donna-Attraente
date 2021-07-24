class RemoveDesignContributorIdFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :design_contributor_id, :integer
  end
end
