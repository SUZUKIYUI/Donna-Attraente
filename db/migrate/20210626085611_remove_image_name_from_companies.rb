class RemoveImageNameFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :image_name, :string
  end
end
