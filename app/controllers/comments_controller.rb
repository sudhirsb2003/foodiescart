class CommentsController < InheritedResources::Base

 def create
  @comment = Comment.create(params[:comment])
  if @comment.save
   @recipe = @comment.recipe_id
   redirect_to recipe_path(@recipe), :notice => "zaks"
  end
 end 

end
