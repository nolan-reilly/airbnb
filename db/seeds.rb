
20.times do
  Property.create!({
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
end
