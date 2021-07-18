class RenameContributorIdColumnToNotification2s < ActiveRecord::Migration[5.2]
  def change
    rename_column :notification2s, :contributor_id, :design_contributor_id
  end
end
