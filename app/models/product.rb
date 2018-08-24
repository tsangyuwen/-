class Product < ApplicationRecord
  mount_uploader :main_image, ImageUploader
  validates :name, presence: true
  validates :price, presence: true

  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items
end
