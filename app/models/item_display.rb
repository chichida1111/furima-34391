class ItemDisplay < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :ship_burden
  belongs_to :ship_source
  belongs_to :ship_date

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :ship_burden_id
    validates :ship_date_id
  end

  validates :ship_source_id, presence: true, numericality: { other_than: 0 }

  validates :item_price, presence: true, numericality: { with: /^[0-9]+$/ }
  validates_inclusion_of :item_price, in: 300..9999999


  with_options presence: true do
    validates :item_name
    validates :item_explain
    validates :image
  end

end
