class Public::FightsController < ApplicationController
  def create
    @training_post = TrainingPost.find(params[:training_post_id])
    fight = current_end_user.fights.new(training_post_id: @training_post.id)
    fight.save
    #redirect_back fallback_location: root_path
    render "replace_btn"
  end

  def destroy
    @training_post = TrainingPost.find(params[:training_post_id])
    fight = current_end_user.fights.find_by(training_post_id: @training_post.id)
    fight.destroy
    #redirect_back fallback_location: root_path
    render "replace_btn"
  end
end
