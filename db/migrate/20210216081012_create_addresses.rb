class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postel_code,      null: false
      t.integer :shipment_id,     null:false
      t.string :city,             null:false
      t.string :house_number,     null:false
      t.string :building
      t.integer :tell,            null:false
      t.references :buyer,        foreign_key: true
      t.timestamps
    end
  end
end
