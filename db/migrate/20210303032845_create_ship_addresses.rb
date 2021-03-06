class CreateShipAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :ship_addresses do |t|
      t.string     :postal_code,    null: false
      t.integer    :ship_source_id, null: false
      t.string     :city,           null: false
      t.string     :street,         null: false
      t.string     :building_name
      t.references :item_purchase,  null: false, foreign_key: true
      t.string     :phone_number,   null: false
      t.timestamps
    end
  end
end