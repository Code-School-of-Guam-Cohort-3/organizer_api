2.times do
    User.create(name: Faker::Name.name)
end

5.times do
    Task.create(name: Faker::Book.title, description: Faker::Lorem.paragraph, user_id: 1)
end

5.times do
    Task.create(name: Faker::Book.title, description: Faker::Lorem.paragraph, user_id: 2)
end
