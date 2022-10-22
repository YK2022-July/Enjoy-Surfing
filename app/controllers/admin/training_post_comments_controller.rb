class Admin::TrainingPostCommentsController < ApplicationController
  #投稿（コメント）確認用
  def administrate
    @comments = TrainingPostComment.all
  end

  #コメント削除処理用
  def erase
  end
end
