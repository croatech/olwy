DEFAULT_COUNT = 10

if Category.count < 4
  DEFAULT_COUNT.times do |count|
    Category.create!(name: Faker::Lorem.word, preview: Faker::Avatar.image, 
                     background: 'https://marciepettitta2.files.wordpress.com/2011/11/backgroun-effect.jpg', 
                     slug: "cat_#{count}", desc: Faker::Lorem.sentences(5))
  end
end

if Product.count < DEFAULT_COUNT
  DEFAULT_COUNT.times do |count|
    Product.create!(id: count, name: Faker::Lorem.word, desc: Faker::Lorem.sentence, price: rand(1..100), 
                    category: Category.all.sample, rating: rand(1.1..4.9), image: Faker::Avatar.image,
                    height: rand(0..100), width: rand(0..100), depth: rand(0..100),
                    material: Faker::Lorem.sentences, related: "5, 6, 3, 2")
  end
end

if Post.count < DEFAULT_COUNT
  DEFAULT_COUNT.times do 
    Post.create!(title: Faker::Lorem.word, text: Faker::Lorem.sentences(5), tags: 'tag1, tag2',
                 image: File.new("#{Rails.root}/app/assets/images/pages/blog/post-bg.jpg"))
  end
end

Page.destroy_all
Page.create(slug: 'blog', text: Faker::Lorem.sentences(5), image: File.new("#{Rails.root}/app/assets/images/pages/blog/bg.jpg"),
            heading: 'Добро пожаловать в блог Оули!')
Page.create(slug: 'our_products', text: Faker::Lorem.sentences(5), image: File.new("#{Rails.root}/app/assets/images/pages/our-products/bg.jpg"),
            heading: 'Изделия от оули -')
Page.create(slug: 'about', text: Faker::Lorem.sentences(5), image: File.new("#{Rails.root}/app/assets/images/pages/about/bg.jpg"),
            heading: 'Знакомьтесь, Это Оули!')
Page.create(slug: 'carts', text: 'На этой странице Вы можете оформить заказ на все изделия, которые выбрали на нашем сайте. При заказе на сумму от 3 000 руб. мы осуществляем бесплатную доставку по городу!', 
            image: File.new("#{Rails.root}/app/assets/images/pages/cart/bg.jpg"),
            heading: 'Ваша корзина')