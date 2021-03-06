class ItemPurchaseShipAddress
  include ActiveModel::Model
  attr_accessor :item_display_id, :user_id, :postal_code, :ship_source_id, :city, :street, :building_name, :item_purchase_id, :phone_number, :token

  with_options presence: true do
    validates :item_display_id, :user_id, :city, :street, :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid. Within 11 digits"}
    validates :ship_source_id, numericality: {other_than: 0, message: "can't be blank"}
  end

  def save
    item_purchase = ItemPurchase.create(item_display_id: item_display_id, user_id: user_id)
    ShipAddress.create(postal_code: postal_code, ship_source_id: ship_source_id, city: city, street: street, building_name: building_name, phone_number: phone_number, item_purchase_id: item_purchase.id )
  end

end