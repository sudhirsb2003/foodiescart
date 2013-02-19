class Rating < ActiveRecord::Base
  attr_accessible :recipe_id, :value
end
