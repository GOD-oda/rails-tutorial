User.create!(name: 'oda', age: 25, profile: 'this is oda.')
99.times do |i|
  User.create(name: "name_#{i}", age: i, profile: "profile_#{i}")
end

users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }