class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  def self.set_where(categories)
    where = []
    categories.each do |c|
      where << c.where
    end
    where = where.uniq
  end
end
