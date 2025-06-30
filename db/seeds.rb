user = User.create!({
  email: "test@gmail.com",
  password: "password"
})


6.times do |i|
  property = Property.create!({
    name: Faker::Name.name,
    description: Faker::Lorem.sentence(word_count: 15),
    headline: Faker::Lorem.sentence(word_count: 5),
    address_1: Faker::Address.street_address,
    address_2: Faker::Address.street_name,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
    price: Money.from_amount((50..100).to_a.sample, "USD")
  })

  property.images.attach(io: File.open("db/images/property_#{i + 1}.jpg"), filename: property.name)
  property.images.attach(io: File.open("db/images/property_#{i + 7}.jpg"), filename: property.name)

  ((5..10).to_a.sample).times do
    Review.create!({
      content: Faker::Lorem.sentence(word_count: 15),
      cleanliness_rating: (1..5).to_a.sample,
      accuracy_rating: (1..5).to_a.sample,
      checkin_rating: (1..5).to_a.sample,
      communication_rating: (1..5).to_a.sample,
      location_rating: (1..5).to_a.sample,
      value_rating: (1..5).to_a.sample,
      property: property,
      user: user
    })
  end
end
