require 'faker'
require_relative 'app/models/user'
require_relative 'app/models/article'

5.times do
  u = User.new(username: Faker::Name.unique.first_name, email: Faker::Internet.unique.email, password: Faker::Internet.password)
  u.save
  5.times do
    a = Article.new(user: u, title: Faker::Food.unique.measurement, description: Faker::Food.description)
    a.save
  end
end