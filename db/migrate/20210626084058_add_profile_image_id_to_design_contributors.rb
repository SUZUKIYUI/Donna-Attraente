class AddProfileImageIdToDesignContributors < ActiveRecord::Migration[5.2]
  def change
    add_column :design_contributors, :profile_image_id, :string
  end
end
