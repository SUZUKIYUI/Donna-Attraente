class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :contributor_id, null: false
      t.bigint :visited_user_id, null: false
      t.string :visited_user_type, null: false
      t.integer :post_id
      t.integer :comment_id
      t.integer :offer_id
      t.string :action, null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
