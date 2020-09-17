class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,  null: false, default: ""
      t.string :description,  null: false, default: ""
      t.string :category,  null: false, default: ""
      t.string :condition,  null: false, default: ""
      t.string :shipment_fee,  null: false, default: ""
      t.string :shipment_region,  null: false, default: ""
      t.string :shipment_schedule,  null: false, default: ""
      t.string :price,  null: false, default: ""
      t.timestamps
    end
  end
end
