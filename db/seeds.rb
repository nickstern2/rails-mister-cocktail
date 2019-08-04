require 'open-uri'
require 'json'

url = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
response = JSON.parse(url)

response['drinks'].each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
end
