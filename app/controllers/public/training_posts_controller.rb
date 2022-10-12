class Public::TrainingPostsController < ApplicationController
  def new
    @training_post = TrainingPost.new
  end

  def create
    training_post = TrainingPost.new(training_post_params)
    training_post.save
    redirect_to training_posts_show_path(training_post.id)
  end

  def index
  end

  def show
    @training_post = TrainingPost.find(params[:id])
    #@end_user = EndUser.find(params[:end_user_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def training_post_params
    params.require(:training_post).permit(
      :title,
      :body,
      :date,
      :start_time,
      :end_time,
      :round,
      :point,
      :weather,
      :wind,
      :condition,
      :size,
      :people,
      :board,
      :wetsuit,
      :take_off,
      :goal,
      :is_active
    )
  end

end
