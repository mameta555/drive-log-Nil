class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @drive_routes = @user.drive_routes.page(params[:page]).per(8).order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  def check
    @user = current_user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = '退会しました'
    redirect_to root_path
  end

  def likes
    @user = User.find(params[:id])
    # ユーザーidがこのユーザーのいいねのレコードを全て取得し、その投稿idも取得する
    # whereは条件にマッチしたレコードすべての取得
    # plunkは()内のカラムの一覧を取得
    likes = Like.where(user_id: @user.id).pluck(:drive_route_id)
    # 特定のユーザーがいいねした記事のidを取得
    @likes_drive_routes = DriveRoute.find(likes)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user), notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
