class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visitor_design_contributor_id, null: true
      t.integer :visited_design_contributor_id, null: true
      t.integer :visitor_company_id, null: true
      t.integer :visited_company_id, null: true
      t.integer :post_id
      t.integer :comment_id
      t.integer :offer_id
      t.string :action, default: "", null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
