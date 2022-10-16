class Public::TrainingPostsController < ApplicationController
  def new
    @training_post = TrainingPost.new
  end

  def create
    @training_post = TrainingPost.new(training_post_params)
    @training_post.end_user_id = current_end_user.id
    @training_post.save
    redirect_to training_posts_show_path(@training_post.id)
  end

  def index
    @training_posts = TrainingPost.active.order(date: "DESC")

    #タグ検索用（AND検索）
    if params[:tag_ids]
      @training_posts = []
      params[:tag_ids].each do |key, value|
        if value == "1"
          tags = Tag.find_by(name: key).training_posts
          @training_posts = (@training_posts.empty? ? tags : @training_posts & tags).active.order(date: "DESC")
        end
      end
    end
  end

  def my_posts
    @training_posts = current_end_user.training_posts
  end

  def show
    @training_post = TrainingPost.find(params[:id])
    @end_user = @training_post.end_user
  end

  def edit
    @training_post = TrainingPost.find(params[:id])
  end

  def update
    training_post = TrainingPost.find(params[:id])
    training_post.update(training_post_params)
    redirect_to training_posts_show_path(training_post.id)

  end

  def destroy
    @training_post = TrainingPost.find(params[:id])
    @training_post.destroy
    redirect_to training_posts_index_path
  end


  private

  def training_post_params
    params.require(:training_post).permit(
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
      :post_image,
      :is_active,
      {tag_ids: []}
    )
  end


end
