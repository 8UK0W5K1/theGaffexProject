# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Article.destroy_all
Tag.destroy_all

# Table Users

user_first = User.create(email: "francis@gmail.com", password: "123456", first_name: "Francis", last_name: "Fake")
user_second = User.create(email: "hiprapenepo-8910@yopmail.com", password: "123456", first_name: "Chuck", last_name: "Norris")
puts " two users"
# Table Articles

10.times do |article|
    puts " article created "
    article = Article.create(
        user: User.all[rand(0..1)],
        title: Faker::Movie.title,
        summary: Faker::Lorem.paragraph(sentence_count: 10),
        introduction: Faker::Lorem.paragraph(sentence_count: 20),
        protocol: Faker::Lorem.paragraph(sentence_count: 60),
        result: Faker::Lorem.paragraph(sentence_count: 40),
        conclusion: Faker::Lorem.paragraph(sentence_count: 30),
        references: Faker::Internet.url
    )
end

# Table Tag

Article.all.each do |article|
    puts " tag_article created"
    Tag.create(user: user_first, article: article, tag_name: ["Approuved", "Not Approved", "Need Rewiew"].sample)
    Tag.create(user: user_second, article: article, tag_name: ["Approuved", "Not Approved", "Need Rewiew"].sample)
end
