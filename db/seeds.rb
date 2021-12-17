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
Keyword.destroy_all
Category.destroy_all

# Table Users
#
# used hardcoded path because i couldn't fiond any way to use the asset pipeline to generate the right path for the
# images, I watched the doc files for asset pipeline and active storage and a lot of stack overflow, neither of them gave me
# even clues on how to do this
user_first = User.create(email: "francis@gmail.com", password: "123456", first_name: "Francis", last_name: "Fake", admin: true)
user_first.avatar.attach(

  io: File.open(Rails.root.join('app', 'assets', 'images', 'chuck-norris.jpg')),
  filename: 'default.jpg',
  content_type: 'image/jpg'
)
user_second = User.create(email: "hiprapenepo-8910@yopmail.com", password: "123456", first_name: "Chuck", last_name: "Norris", admin: false)
user_second.avatar.attach(
  io: File.open(Rails.root.join('app', 'assets', 'images', 'chuck-norris.jpg')),
  filename: 'default.jpg',
  content_type: 'image/jpg'
)
puts " two users"

# categories

categories = [
  'Astronomie',
  'Biochimie',
  'Biologie',
  'Chimie',
  'Energie',
  'Environement',
  'Informatique',
  'Ingenieurie',
  'Mathematiques',
  'Médecine',
  'Physique',
  'Pharmacie',
  'Sciences humaines'
]

categories.each do |category|
  Category.create(name: category)
end

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
    references: Faker::Internet.url,
    category: Category.all.sample
  )
  article.picture.attach(io: File.open('./app/assets/images/default_picture.jpg'), filename: 'default.jpg')
end

# keywords

30.times do
  Keyword.create(name: Faker::Lorem.word.capitalize)
end

# Table Tag + keywords

Article.all.each do |article|
  puts " tag_article created"
  Tag.create(user: user_first, article: article, tag_name: ["Approved", "Not Approved", "Need Review"].sample)
  Tag.create(user: user_second, article: article, tag_name: ["Approved", "Not Approved", "Need Review"].sample)
  number = rand(5..10)
  number.times do
    KeywordToArticle.create(article: article, keyword: Keyword.all.sample)
  end
end
