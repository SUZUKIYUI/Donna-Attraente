class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :design_contributor_id
      t.string :post_image_id, null: false, default: ""
      t.text :author_comment

      t.timestamps
    end
  end
end
