# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

# Table Users

User.create(email: "francis@gmail.com", password: "123456")
User.create(email: "hiprapenepo-8910@yopmail.com", password: "123456")

# Table Articles

10.times do |article|
    article = Article.create(
        title: Faker::Movie.title,
        abstract: Faker::Lorem.paragraph,
        introduction: Faker::Lorem.paragraph_by_chars,
        protocol: Faker::Lorem.paragraph_by_chars,
        results: Faker::Lorem.paragraph_by_chars,
        conclusion: Faker::Lorem.paragraph_by_chars,
        10.times do 
            reference.create()
        end
    )

end

