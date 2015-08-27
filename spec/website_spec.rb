require('spec_helper')

describe(Website) do
  it { should belong_to(:recipe) }
end
