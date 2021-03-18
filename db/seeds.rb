require 'json'
require 'open-uri'

puts 'Cleaning database...'
Ingredient.destroy_all

puts 'Creating Ingredients...'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_list = open(url).read
ingredients = JSON.parse(ingredients_list)
ingredients_array = ingredients['drinks']

ingredients_array.each do |element|
  ingredient = element["strIngredient1"]
  my_ingredient = Ingredient.create!(name: ingredient)
  puts "Created #{my_ingredient.name}"
end
puts 'Finished!'
