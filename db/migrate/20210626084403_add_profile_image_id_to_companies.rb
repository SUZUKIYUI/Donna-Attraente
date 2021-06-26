class AddProfileImageIdToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :profile_image_id, :string
  end
end
