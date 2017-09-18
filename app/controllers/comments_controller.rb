class CommentsController < ApplicationController
  http_basic_authenticate_with name: 'matt', password: 'password1', only: [:destroy]
  def create
    puts params[:comment].inspect
    @cat = Cat.find(params[:cat_id])
    @comment = @cat.comments.create(comment_params)
    redirect_to cat_path(@cat)
  end
  def destroy
    @cat = Cat.find(params[:cat_id])
    @comment = @cat.comments.find(params[:id])
    @comment.destroy
    redirect_to cat_path(@cat)
  end



  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
