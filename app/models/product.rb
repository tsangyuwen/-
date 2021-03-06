class Product < ApplicationRecord
  validates_presence_of :color, :size, :stock

  mount_uploader :image, ImageUploader

  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items

  belongs_to :item
end
