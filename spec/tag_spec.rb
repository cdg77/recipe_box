require('spec_helper')

describe(Tag) do
  it('has many recipes') do
    test_tag = Tag.create({:description => 'Fall'})
    test_recipe1 = test_tag.recipes.create(:name => 'Pumpkin Cheesecake Bars')
    test_recipe2 = test_tag.recipes.create(:name => 'Pumpkin Curry')
    expect(test_tag.recipes()).to(eq([test_recipe1, test_recipe2]))
  end
end
