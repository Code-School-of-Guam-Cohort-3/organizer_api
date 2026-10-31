roles = ["admin", "user"]

5.times do
    user = User.create(name: Faker::Name.name, email: "#{Faker::Name.name}@gmail.com", password: "password123", password_confirmation: "password123", user_role: roles.sample)
    2.times do
        Task.create(name: Faker::Book.title, description: Faker::Lorem.paragraph, user_id: user.id)
    end
end

# 5.times do
#     Task.create(name: Faker::Book.title, description: Faker::Lorem.paragraph, user_id: 2)
# end

puts "Created 5 users and 2 tasks per user, 10 tasks total"