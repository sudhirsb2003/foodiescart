class Comment < ActiveRecord::Base
  attr_accessible :comment_data, :recipe_id, :user_id
  belongs_to :recipe
  belongs_to :user
end
