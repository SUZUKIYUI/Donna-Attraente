class RemoveContributorIdFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :contributor_id, :integer
  end
end
