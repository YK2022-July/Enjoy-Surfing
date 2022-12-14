class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  before_action :correct_end_user, only: [:edit, :update, :unsubscribe, :cancel]

  def create
    @user_image = EndUser.new(end_user_params)
    @user_image.id = current_end_user.id
    @user_image.save
    redirect_to request.referer
  end

  def index
    @end_users = EndUser.all
  end

  def show
    @end_user = EndUser.find(params[:id])
    @goal = Goal.where(end_user_id: @end_user.id).last
    @immediate_goal = ImmediateGoal.where(end_user_id: @end_user.id).last
    @today_goal = TodayGoal.where(end_user_id: @end_user.id).last
    @user_image = EndUser.new
    @training_posts = current_end_user.training_posts.all.order(date: "DESC")
  end

  def edit
    @end_user = EndUser.find(params[:id])
    @areas = Area.all
  end

  def update
    end_user = EndUser.find(params[:id])
    end_user.update(end_user_params)
    redirect_to my_page_path(end_user.id)
  end

  #退会処理後のview表示用
  def unsubscribe
  end

  #退会機能用のアクション
  def cancel
    @end_user = EndUser.find(params[:id])
    #退会ステータス（is_deleted）を"true"に更新し論理削除状態にする
    @end_user.update(is_deleted: true)
    reset_session
    redirect_to after_cancel_path
  end

  def correct_end_user
    @end_user = EndUser.find(params[:id])
    unless @end_user.id == current_end_user.id
      redirect_to my_page_path(current_end_user)
    end
  end

  private
  def end_user_params
    params.require(:end_user).permit(
      :area,
      :type_name,
      :name,
      :age,
      :sex,
      :home,
      :stance,
      :history,
      :introduction,
      :is_deleted,
      :user_image,
    )
  end
end
