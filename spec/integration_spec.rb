require('spec_helper')

describe('the path of recipe_box', {:type => :feature}) do
  it('takes the user to the home page') do
    visit('/')
    expect(page).to have_content('Recipe Box')
  end
  it('lets you add a tag to the list of tags') do
    visit('/')
    fill_in('description' :with => "Rustic")
    click_button("Tag It")
    expect(page).to have_content('Rustic')
  end
end
