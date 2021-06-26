class RemoveImageNameFromDesignContributors < ActiveRecord::Migration[5.2]
  def change
    remove_column :design_contributors, :image_name, :string
  end
end
