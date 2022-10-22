class Public::SearchesController < ApplicationController
  #before_action :authenticate_user!

  #キーワード検索の条件
  def search
    if params[:word].present?
      @training_posts = TrainingPost.active.where('body LIKE ?', "%#{params[:word]}%").order(date: "DESC")
      @word = params[:word]
    else
      @training_posts = TrainingPost.active.order(date: "DESC")
    end
  end
end
