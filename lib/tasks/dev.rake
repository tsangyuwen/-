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

  task fake_top_title: :environment do
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.read_timeout = 120 # seconds

    browser = Watir::Browser.start 'https://trends.google.com.tw/trends/trendingsearches/daily?geo=TW', :chrome, headless: true, http_client: client

    g_text = browser.text.split("\n")

    i = 10
    while i < g_text.length-20
      if g_text[i][0..4].to_i > 2000
        i = i + 2
      elsif g_text[i].to_i == 1
        i = i + 1
      else
        scrape = Scrape.new
        scrape.title = g_text[i]
        scrape.which = "top"
        if g_text[i + 3].to_i > 500
          scrape.size = g_text[i + 3].to_i / 150 + 10
        else
          scrape.size = g_text[i + 3].to_i * 2 + 60
        end
        scrape.save!
        i = i + 8
      end
    end 

    browser.goto 'https://tw.yahoo.com/'

    y_text = browser.text[0..500].split("\n")
    
    i = 0
    y_text[5..12].each do |y|
      Scrape.create!(title: y,
        size: 40 - i * 3,
        which: "top"
        )
      i += 1
    end

    browser.close
  end

end
