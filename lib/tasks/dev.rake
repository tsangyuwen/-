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
    Product.destroy_all

    20.times do |i|
      Product.create!(name: FFaker::Name.first_name,
        price: FFaker::AddressNL.building_number
        )
    end

    puts "have created fake product"
    puts "now you have #{Product.count} products"
  end
end
