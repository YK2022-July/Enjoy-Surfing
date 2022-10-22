class Admin::TrainingPostCommentsController < ApplicationController
  #投稿（コメント）確認用
  def index
    @comments = TrainingPostComment.all
  end

  #コメント詳細表示用
  def show
    @comment = TrainingPostComment.find(params[:id])
  end

  #コメント削除処理
  def destroy
    @comment = TrainingPostComment.find(params[:id])
    @comment.destroy
    redirect_to admin_training_post_comments_path
  end
end
