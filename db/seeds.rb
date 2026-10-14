2.times do
    user = User.create(name: Faker::Name.name, email: "#{Faker::Name.name}@gmail.com", password: "password123", password_confirmation: "password123")
    5.times do
        Task.create(name: Faker::Book.title, description: Faker::Lorem.paragraph, user_id: user.id)
    end
end

# 5.times do
#     Task.create(name: Faker::Book.title, description: Faker::Lorem.paragraph, user_id: 2)
# end

puts "Created 2 users and 5 tasks per user, 10 tasks total"