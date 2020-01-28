8.times do
  Category.create! name: Faker::Hacker.ingverb.capitalize
end

category_ids = Category.pluck(:id)

print "Product "
200.times do
  product = Product.create! name: "#{Faker::Hacker.verb} #{Faker::Hacker.noun}".capitalize,
    description: Faker::Hacker.say_something_smart,
    long_description: Faker::Movies::Lebowski.quote,
    category_id: category_ids.sample,
    price: Faker::Number.decimal(l_digits: 3, r_digits: 2)
  product.remote_photo_url = Faker::LoremFlickr.grayscale_image(size: "640x480")

  product.save
  print "."
end
puts
