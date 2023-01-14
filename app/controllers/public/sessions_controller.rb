# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]

  def guest_sign_in
    user = User.guest
    sign_in user # ゲストユーザーをログイン状態にする
    redirect_to root_path, notice: 'guestuserでログインしました。'
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

  protected
  # 退会しているかを判断するメソッド
    def user_state
      ## 【処理内容1】 入力されたemailからアカウントを1件取得
      @user = User.find_by(email: params[:user][:email])
      ## アカウントを取得できなかった場合、このメソッドを終了する
      return if !@user
      ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
      if @user.valid_password?(params[:user][:password])
      ## 【処理内容3】退会済みのユーザーかどうか判別（is_deletedがtrueであれば新規登録画面へ）
        if @user.is_deleted == true
          flash[:danger] = 'お客様は退会済みです。申し訳ございませんが、別のメールアドレスをお使いください。'
          redirect_to new_user_registration_path
        end
      # パスワードが一致していて退会ステータスがfalseの場合はそのまま処理を実行

      else
        # パスワードが一致しないときはログイン画面に戻る
        flash[:danger] = 'パスワードが一致しません。恐れ入りますが、確認のためもう一度パスワードをご入力ください'
        redirect_to new_user_session_path
      end
    end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
