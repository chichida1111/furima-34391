class ItemPurchase < ApplicationRecord

  belongs_to :item_display
  has_one    :ship_address
  belongs_to :user

end
