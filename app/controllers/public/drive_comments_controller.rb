class Public::DriveCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:destroy]
  
  def create
    drive_route = DriveRoute.find(params[:drive_route_id])
    comment = current_user.drive_comments.new(drive_comment_params)
    comment.drive_route_id = drive_route.id
    comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    comment = DriveComment.find(params[:id])
    comment.destroy
    redirect_to drive_route_path(params[:drive_route_id])
  end

  private

  def drive_comment_params
    params.require(:drive_comment).permit(:comment)
  end
  
  def ensure_correct_user
    @drive_route = DriveRoute.find(params[:id])
    @comment = DriveComment.find(params[:id])
    unless @comment.user == current_user
      redirect_to drive_route_path(@drive_route)
    end
  end
end
