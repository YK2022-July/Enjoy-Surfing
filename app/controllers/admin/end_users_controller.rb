class Admin::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.all
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    end_user = EndUser.find(params[:id])
    end_user.update(end_user_params)
    redirect_to request.referer
  end

  private
  def end_user_params
    params.require(:end_user).permit(
      :is_suspended
    )
  end
end
