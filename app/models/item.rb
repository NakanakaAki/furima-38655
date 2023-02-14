class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :shipping_area_id
    validates :delivery_day_id
    validates :price

    # validates :user_id
  end

  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  # active_storageとのアソシエーション
  has_one_attached :image

  # テーブルとのアソシエーション
  belongs_to :user

  # アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :delivery_day
  belongs_to :shipping_area

  # アクティブハッシュの「---」は保存できない
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :shipping_area_id
    validates :status_id
    validates :delivery_charge_id
    validates :delivery_day_id
  end
end
