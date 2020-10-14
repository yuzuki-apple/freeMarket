class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.references :category, foreign_key: true

      t.references :user,foreign_key: true
      t.string :name, null: false, default: ""
      t.string :description, null: false, default: ""
      t.string :brand
      t.string :condition, null: false, default: ""
      t.integer :shipment_fee_id,  null: false, default: 0
      t.integer :shipment_region_id,  null: false, default: 0
      t.integer :shipment_schedule_id,  null: false, default: 0
      t.integer :price, null: false, default: nil

      t.timestamps
    end
  end
end
