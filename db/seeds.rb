User.create!(name: "Example User",
             email: "example@railstutorial.org",
             password: "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now,
             reset_sent_at: Time.zone.now)
20.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               admin: true,
               activated: true,
               activated_at: Time.zone.now,
               reset_sent_at: Time.zone.now)
end

users = User.order(:created_at).take(6)

30.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

users = User.all
user = users.first
following = users[2..20]
followers = users[2..15]
following.each{|followed| user.follow(followed)}
following.each{|follower| follower.follow(user)}
