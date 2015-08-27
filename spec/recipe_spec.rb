require('spec_helper')

describe(Recipe) do

  it { should have_many(:websites) }

  it("has many tags") do
    test_recipe = Recipe.create({:name => "Pumpkin bread" })
    test_tag1 = Tag.create({:description => "Fall", :recipe_ids => [test_recipe.id()]})
    test_tag2 = Tag.create({:description => "happy", :recipe_ids => [test_recipe.id()]})
    expect(test_recipe.tags()).to(eq([test_tag1, test_tag2]))
  end

  it('other way') do
    test_recipe = Recipe.create({:name => "Pumpkin bread"})
    test_tag1 = test_recipe.tags.create(:description => "Fall")
    test_tag2 = test_recipe.tags.create(:description => "Happy")
    expect(test_recipe.tags()).to(eq([test_tag1, test_tag2]))
  end

  
end
