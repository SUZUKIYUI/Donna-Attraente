class AddDesignContributorIdToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :design_contributor_id, :integer
  end
end
