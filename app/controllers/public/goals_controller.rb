class Public::GoalsController < ApplicationController
  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save!
      flash[:notice] = "目標を設定しました！"
      redirect_to my_page_path(current_end_user.id)
    else
      flash[:notice] = "目標の登録に失敗しました。"
      render :new
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  private

  def goal_params
    params.require(:goal).permit(
      :end_user_id,
      :goal,
      #:immediate_goals_attributes,
      #:today_goals_attributes,
      immediate_goals_attributes: [:end_user_id, :goal1, :goal2, :_destroy],
      today_goals_attributes: [:end_user_id, :training_post_id, :goal1, :goal2, :goal3, :_destroy]
      )
  end
end
