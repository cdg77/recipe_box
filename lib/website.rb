class Website < ActiveRecord::Base
  belongs_to(:recipe)
end
