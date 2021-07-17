class CreateNotification2s < ActiveRecord::Migration[5.2]
  def change
    create_table :notification2s do |t|
      t.integer :company_id, null: false
      t.integer :contributor_id, null: false
      t.integer :post_id, null: false
      t.integer :offer_id, null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
