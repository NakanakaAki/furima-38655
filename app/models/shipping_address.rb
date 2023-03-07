class ShippingAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :buyer
  belongs_to :shipping_area
end
