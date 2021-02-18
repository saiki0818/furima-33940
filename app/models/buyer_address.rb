class BuyerAddress
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postel_code, :shipment_id, :city, :house_number, :building, :tell, :buyer_id

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :postel_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipment_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :tell, format:{with: /\A[0-9]+\z/}
    # validates :buyer_id
  end

  def save
    buyer = Buyer.create(user_id: user_id, product_id: product_id)
    Address.create(postel_code: postel_code, shipment_id: shipment_id, city: city, house_number: house_number, tell: tell, buyer_id: buyer.id)
  end

end