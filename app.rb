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

patch('/recipes/:id') do
  @recipes = Recipe.all()
  @recipe = Recipe.find(params.fetch('id').to_i())
  name =  params.fetch('name')
  @recipe.update({:name => name})
  redirect("/recipes/#{@recipe.id()}")
end

delete("/recipes/:id") do
  @recipes = Recipe.all()
  @recipe = Recipe.find(params.fetch('id').to_i())
  @recipe.destroy()
  redirect('/')
end

delete("/recipes/:id/tags/:tag_id") do
  @recipes = Recipe.all()
  @recipe = Recipe.find(params.fetch('id').to_i())
  @tags = Tag.all()
  @tag = Tag.find(params.fetch('tag_id').to_i())
  @tag.destroy()
  redirect("/recipes/#{@recipe.id()}")
end

get("/tags/:id") do
@tags = Tag.all()
@tag = Tag.find(params.fetch('id').to_i())
@recipes = Recipe.all()
erb(:tag)
end

post('/tags/:id') do
  @tags = Tag.all()
  @recipes = Recipe.all()
  @tag = Tag.find(params.fetch('id').to_i())
  name = params.fetch('name')
  @tag.recipes.create(:name => name)
  redirect("/tags/#{@tag.id()}")
end

delete("/tags/:id/recipes/:recipe_id") do
  @tags = Tag.all()
  @tag = Tag.find(params.fetch('id').to_i())
  @recipes = Recipe.all()
  @recipe = Recipe.find(params.fetch('recipe_id').to_i())
  @recipe.destroy()
  redirect("/tags/#{@tag.id()}")
end

patch('/tags/:id') do
  @tags =Tag.all()
  @tag =Tag.find(params.fetch('id').to_i())
  description =  params.fetch('description')
  @tag.update({:description => description})
  redirect("/tags/#{@tag.id()}")
end
