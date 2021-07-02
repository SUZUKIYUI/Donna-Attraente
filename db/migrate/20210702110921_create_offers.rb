class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.text :offer_comment, null: false, default: ""
      t.integer :offer_status, null: false, default: 0
      t.integer :company_id, null: false
      t.integer :post_id, null:false

      t.timestamps
    end
  end
end
