class Product < ApplicationRecord
  
  belongs_to :user
  has_one  :buyer
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :deliver_fee
  belongs_to :shipment
  belongs_to :shipment_day

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :deliver_fee_id
    validates :shipment_id
    validates :shipment_day_id
  end

  with_options presence: true do
    validates :product_name
    validates :description
    validates :price, format:{with: /\A[0-9]+\z/}, numericality:{only_integer:true, greater_than:300,less_than:9999999}
  end
end
