class CreateItemDisplays < ActiveRecord::Migration[6.0]
  def change
    create_table :item_displays do |t|
      t.string     :item_name,      null: false
      t.text       :item_explain,   null: false
      t.integer    :ship_burden_id, null: false
      t.integer    :ship_source_id, null: false
      t.integer    :ship_date_id,   null: false
      t.integer    :item_price,     null: false
      t.references :user,           null: false, foreign_key: true, type: :bigint
      # t.references :comment,        null: false, foreign_key: true
      t.integer    :category_id,    null: false
      t.integer    :status_id,      null: false
      t.timestamps
    end
  end
end
