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
  @tags = Tag.all()
  @recipes = Recipe.all()
  @recipe = Recipe.find(params.fetch('id').to_i())
  erb(:recipe)
end

post('/recipes/:id') do
  @recipes = Recipe.all()
  @tags = Tag.all()
  @recipe = Recipe.find(params.fetch('id').to_i())
  description = params.fetch('description')
  @recipe.tags.create(:description => description)
  redirect("/recipes/#{@recipe.id()}")
  # redirect('/recipes/'.concat(@recipe.id().to_s()))
end
