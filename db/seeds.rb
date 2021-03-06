# Create 50 Users (Owners)
50.times do
    username = Faker::Lorem.unique.word
    email = Faker::Internet.unique.email
    password = Faker::Internet.password
    name = Faker::Name.name

    User.create(username: username, email: email, password: password, name: name)
end

# Create 3 Properties per User (Owner)
User.all.each do |user|
    3.times do
        address = Faker::Address.unique.full_address
        price = Faker::Number.between(from: 1000, to: 12000000)
        date_sold = Faker::Date.between(from: '1911-01-01', to: Date.current)
        acreage = Faker::Number.between(from: 0.01, to: 369.00).round(2)

        user.properties.create(address: address, price: price, date_sold: date_sold, acreage: acreage)
    end
end

# Create 1 Building per Property
Property.all.each do |property|
    year_built = Faker::Number.between(from: 1911, to: Date.current.year)
    price = Faker::Number.between(from: 1000, to: 12000000)

    property.buildings.create(year_built: year_built, price: price)
end