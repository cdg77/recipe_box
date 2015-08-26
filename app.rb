require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  @tags = Tag.all()
  @recipes = Recipe.all()
  erb(:index)
end

post('/tags') do
  description = params.fetch('description')
  @tag = Tag.create({:description => description})
  redirect('/')
end

post('/recipes') do
  name = params.fetch('name')
  @recipe = Recipe.create({:name => name})
  redirect('/')
end

get('/recipes/:id') do
  @recipes = Recipe.all()
  @recipe = Recipe.find(params.fetch('id').to_i())
  @tags = Tag.all()
  erb(:recipe)
end
