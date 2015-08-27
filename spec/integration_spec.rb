# require('spec_helper')
#
# describe('the path of recipe_box', {:type => :feature}) do
#   it('takes the user to the home page') do
#     visit('/')
#     expect(page).to have_content('Recipe Box')
#   end
#   it('lets you add a tag to the list of tags') do
#     visit('/')
#     fill_in('description', :with => "Rustic")
#     click_button("Tag It")
#     expect(page).to have_content('Rustic')
#   end
#   it('shows you the details about a recipe') do
#     test_recipe = Recipe.create({:name => "Boulangerie Beans and Potatoes"})
#     tag = test_recipe.tags.create({:description => "French"})
#     visit("/recipes/#{test_recipe.id()}")
#     expect(page).to have_content('Boulangerie Beans and Potatoes')
#     expect(page).to have_content('French')
#   end
#   it('deletes a recipe') do
#     visit('/')
#     test_recipe = Recipe.create({:name => "Boulangerie Beans and Potatoes"})
#     click_button("Toss It!")
#     expect(page).to have_no_content("Boulangerie Beans and Potatoes")
#   end
# end
