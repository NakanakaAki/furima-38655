class BuyerForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :shipping_area_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode,          format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_area_id,  numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number,      format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    validates :token
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(buyer_id: buyer.id, postcode: postcode, shipping_area_id: shipping_area_id,
                           city: city,address: address, building: building, phone_number: phone_number)
  end
end
