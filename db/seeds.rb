# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "eggplant@example.com", password: "ajion2596dhi", role: "admin", name: "root", confirmed_at: "2018-08-23")
User.create(email: "test@example.com", password: "123456", name: "test", confirmed_at: "2018-08-23")

Category.destroy_all

category_woman_list = [
  { where: "上著", name: "T-shirt" },
  { where: "上著", name: "無袖" },
  { where: "上著", name: "長袖" },
  { where: "上著", name: "連帽上衣" },
  { where: "上著", name: "雪紡" },
  { where: "上著", name: "牛仔" },
  { where: "上著", name: "襯衫" },

  { where: "下著", name: "長褲" },
  { where: "下著", name: "短褲" },
  { where: "下著", name: "寬褲" },
  { where: "下著", name: "短裙" },
  { where: "下著", name: "長裙" },

  { where: "外套", name: "連帽外套" },
  { where: "外套", name: "牛仔外套" },
  { where: "外套", name: "西裝外套" },
  { where: "外套", name: "針織外套" },
  { where: "外套", name: "羽絨外套" },

  { where: "連身款", name: "吊帶褲" },
  { where: "連身款", name: "吊帶裙" },
  { where: "連身款", name: "洋裝" },

  { where: "內著", name: "內衣" },
  { where: "內著", name: "內褲" },
  { where: "內著", name: "內搭褲" },
  { where: "內著", name: "襪子" },

  { where: "配件", name: "帽子" },
  { where: "配件", name: "圍巾" }
]

category_woman_list.each do |category|
  Category.create( who: "woman", where: category[:where], name: category[:name])
end

category_man_list = [
  { where: "上著", name: "T-shirt" },
  { where: "上著", name: "無袖" },
  { where: "上著", name: "長袖" },
  { where: "上著", name: "連帽上衣" },
  { where: "上著", name: "牛仔" },
  { where: "上著", name: "襯衫" },

  { where: "下著", name: "長褲" },
  { where: "下著", name: "短褲" },
  { where: "下著", name: "束口褲" },

  { where: "外套", name: "連帽外套" },
  { where: "外套", name: "牛仔外套" },
  { where: "外套", name: "西裝外套" },
  { where: "外套", name: "針織外套" },
  { where: "外套", name: "羽絨外套" },

  { where: "內著", name: "內衣" },
  { where: "內著", name: "內褲" },
  { where: "內著", name: "襪子" },

  { where: "配件", name: "帽子" },
  { where: "配件", name: "圍巾" }
]

category_man_list.each do |category|
  Category.create( who: "man", where: category[:where], name: category[:name])
end

category_kid_list = [
  { where: "上著", name: "T-shirt" },
  { where: "上著", name: "無袖" },
  { where: "上著", name: "長袖" },
  { where: "上著", name: "連帽上衣" },
  { where: "上著", name: "牛仔" },
  { where: "上著", name: "襯衫" },

  { where: "下著", name: "長褲" },
  { where: "下著", name: "短褲" },
  { where: "下著", name: "裙子" },

  { where: "外套", name: "連帽外套" },
  { where: "外套", name: "牛仔外套" },
  { where: "外套", name: "針織外套" },
  { where: "外套", name: "羽絨外套" },

  { where: "內著", name: "內衣" },
  { where: "內著", name: "內褲" },
  { where: "內著", name: "內搭褲" },
  { where: "內著", name: "襪子" },

  { where: "配件", name: "帽子" },
  { where: "配件", name: "圍巾" }
]

category_kid_list.each do |category|
  Category.create( who: "kid", where: category[:where], name: category[:name])
end

category_baby_list = [
  { where: "上著", name: "T-shirt" },
  { where: "上著", name: "無袖" },
  { where: "上著", name: "長袖" },
  { where: "上著", name: "連帽上衣" },
  { where: "上著", name: "牛仔" },
  { where: "上著", name: "襯衫" },

  { where: "下著", name: "長褲" },
  { where: "下著", name: "短褲" },
  { where: "下著", name: "裙子" },

  { where: "外套", name: "連帽外套" },
  { where: "外套", name: "牛仔外套" },
  { where: "外套", name: "針織外套" },
  { where: "外套", name: "羽絨外套" },

  { where: "連身款", name: "包臀衣" },
  { where: "連身款", name: "連身衣" },

  { where: "內著", name: "內衣" },
  { where: "內著", name: "內搭褲" },
  { where: "內著", name: "襪子" },

  { where: "配件", name: "帽子" },
  { where: "配件", name: "口水巾" }
]

category_baby_list.each do |category|
  Category.create( who: "baby", where: category[:where], name: category[:name])
end

puts "Category created!"