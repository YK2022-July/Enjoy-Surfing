class Public::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.all
  end

  def show
    @end_user = EndUser.find(params[:id])
    @goal = Goal.where(end_user_id: @end_user.id).last
    @immediate_goal = ImmediateGoal.where(end_user_id: @end_user.id).last
    @today_goal = TodayGoal.where(end_user_id: @end_user.id).last
  end

  def edit
    @end_user = EndUser.find(params[:id])
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

  private
  def end_user_params
    params.require(:end_user).permit(
      :area_id,
      :type_id,
      :name,
      :age,
      :sex,
      :home,
      :stance,
      :history,
      :introduction,
      :is_deleted,
      :end_user_image,
    )
  end
end
