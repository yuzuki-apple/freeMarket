class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user,                       foreign_key: true
      t.string :name,              null: false
      t.integer :price,            null: false
      t.text :description,         null: false
      t.string :brand                          
      t.string :size                           
      t.string :condition,         null: false
      t.string :shipment_fee,      null: false
      t.string :shipment_region,   null: false
      t.string :shipment_schedule, null: false
      t.timestamps
    end
  end
end
