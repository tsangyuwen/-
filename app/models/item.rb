class Item < ApplicationRecord
  mount_uploader :main_image, ImageUploader

  has_many :products, dependent: :destroy

end
