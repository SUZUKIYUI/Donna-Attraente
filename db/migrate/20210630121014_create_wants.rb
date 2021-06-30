class CreateWants < ActiveRecord::Migration[5.2]
  def change
    create_table :wants do |t|
      t.integer :design_contributor_id
      t.integer :post_id

      t.timestamps
    end
  end
end
