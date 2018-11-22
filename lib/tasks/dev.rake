namespace :dev do
  task fake_user: :environment do
    User.destroy_all

    20.times do |i|
      User.create!()
    end

    puts "have created fake user"
    puts "now you have #{User.count} users"
    puts "rails db:seed"
  end 

  task fake_product: :environment do
    color_list = ['D17978', 'CB7F41', 'D5CF5E', '25422E', '8DC1E8', '22293B', '662E3E', '5D3B24', '000000', 'BBBAC0']
    size_list = ['XL', 'L', 'M', 'S']

    Product.destroy_all

    Item.all.each do |p|

      size_list.each do |s|
        color_list[0..4].each do |c|
          Product.create!(size: s,
            color: c,
            item_id: p.id,
            stock: rand(5...20)
            )
        end
      end
      
    end

    puts "have created fake product"
    puts "now you have #{Product.count} products"
  end

  task fake_item: :environment do

    Category.all.each do |c| 

      5.times do |i|
        Item.create!(name: FFaker::Name.first_name,
          price: FFaker::AddressNL.building_number,
          category_id: c.id
          )
      end

    end

    puts "have created fake item"
    puts "now you have #{Item.count} items"
  end
end
