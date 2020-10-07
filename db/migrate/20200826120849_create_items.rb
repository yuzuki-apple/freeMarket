class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :user_id,  null: false, default: ""
      t.string :name,  null: false, default: ""
      t.string :description,  null: false, default: ""
      t.string :category,  null: false, default: ""
      t.string :brand
      t.string :condition,  null: false, default: ""
      t.integer :shipment_fee_id, null: false, default: nil
      t.string :shipment_region,  null: false, default: ""
      t.string :shipment_schedule,  null: false, default: ""
      t.integer :price, null: false, default: nil
      t.integer :stock, null: false, default: nil
      t.timestamps
    end
  end
end
