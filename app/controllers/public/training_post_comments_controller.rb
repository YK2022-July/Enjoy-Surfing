class Public::TrainingPostCommentsController < ApplicationController
  def create
    @training_post = TrainingPost.find(params[:training_post_id])
    @comment = current_end_user.training_post_comments.new(training_post_comment_params)
    @comment.training_post_id = @training_post.id
    @comment.save
    #render "create"
  end

  def destroy
    @training_post = TrainingPost.find(params[:training_post_id])
    @comment = TrainingPostComment.find_by(id: params[:id], training_post_id: params[:training_post_id])
    @comment.destroy
    #render "destroy"
  end

  private

  def training_post_comment_params
    params.require(:training_post_comment).permit(:comment)
  end
end
