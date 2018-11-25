class Item < ApplicationRecord
  validates_presence_of :name, :category_id, :price

  mount_uploader :main_image, ImageUploader

  has_many :products, dependent: :destroy
  
  belongs_to :category, optional: true
end
