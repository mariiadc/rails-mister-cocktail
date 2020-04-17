# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'


puts "Destroying all"
Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all
Review.destroy_all
puts "Creating seed"

url = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
result = JSON.parse(url)

result['drinks'].map do |drink|
  Ingredient.create(name: drink['strIngredient1'])
end

file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1586531050/mrcocktail/4_ht7yhk.jpg')
file2 = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1586531050/mrcocktail/3_pkj7tg.jpg')
file3 = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1586531050/mrcocktail/2_ox4mja.jpg')
file4 = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1586531050/mrcocktail/5_rsy089.jpg')
file5 = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1586531050/mrcocktail/6_d06jii.jpg')
file6 = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1586531050/mrcocktail/1_sasovp.jpg')
file7 = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1587046618/mrcocktail/GfyrJZWnLjxxK4Nu92Tuu9eH.jpg')

good = Cocktail.create(name: "Strawberry Delight")
good2 = Cocktail.create(name: "Grapefruit Swoon")
good3 = Cocktail.create(name: "Tropical Heaven")
good4 = Cocktail.create(name: "Red Moon")
good5 = Cocktail.create(name: "Bloody Gin")
good6 = Cocktail.create(name: "Popsical Sweetheart")
good7 = Cocktail.create(name: 'Citrus Balm')

review = Review.create(rating: 5, content: "Awesome!", cocktail: good)
review = Review.create(rating: 4, content: "Not bad!", cocktail: good2)
review = Review.create(rating: 3, content: "Meh! Nice, but could be better!", cocktail: good3)
review = Review.create(rating: 5, content: "Awesome!", cocktail: good4)
review = Review.create(rating: 3, content: "Meh! Nice, but could be better!", cocktail: good5)
review = Review.create(rating: 4, content: "Not bad!", cocktail: good6)
review = Review.create(rating: 2, content: "Do not recommend!", cocktail: good)
review = Review.create(rating: 5, content: "Awesome!", cocktail: good2)
review = Review.create(rating: 2, content: "Do not recommend!", cocktail: good3)
review = Review.create(rating: 1, content: "No! Just no...", cocktail: good4)
review = Review.create(rating: 3, content: "Meh! Nice, but could be better!", cocktail: good5)
review = Review.create(rating: 4, content: "Not bad!", cocktail: good6)


ingredient = Ingredient.create(name: 'cookies')
dose = Dose.create(description: '200gr', ingredient: ingredient, cocktail: good)

good.photo.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')
good2.photo.attach(io: file2, filename: 'nes1.jpg', content_type: 'image/jpg')
good3.photo.attach(io: file3, filename: 'nes2.jpg', content_type: 'image/jpg')
good4.photo.attach(io: file4, filename: 'nes3.jpg', content_type: 'image/jpg')
good5.photo.attach(io: file5, filename: 'nes4.jpg', content_type: 'image/jpg')
good6.photo.attach(io: file6, filename: 'nes5.jpg', content_type: 'image/jpg')
good7.photo.attach(io: file7, filename: 'nes6.jpg', content_type: 'image/jpg')
good.save!
good2.save!
good3.save!
good4.save!
good5.save!
good6.save!
good7.save!

puts "I am done here!"
