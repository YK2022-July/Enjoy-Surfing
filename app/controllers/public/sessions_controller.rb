# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_user, only: [:create]

  #ゲストログイン用メソッド
  def guest_sign_in
    end_user = EndUser.guest
    sign_in end_user
    flash[:notice] = "ゲストユーザーでログインしました。"
    redirect_to my_page_path(end_user)
  end

  #退会ユーザーのログイン制限メソッド
  def reject_user
    @end_user = EndUser.find_by(email: params[:end_user][:email])
    if @end_user
      if (@end_user.valid_password?(params[:end_user][:password]) && (@end_user.active_for_authentication? == false))
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_end_user_registration_path
      else
        flash[:notice] = "必須項目を入力してください。"
      end
    end
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
