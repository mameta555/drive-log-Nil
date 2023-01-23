class Public::DriveCommentsController < ApplicationController
  before_action :authenticate_user!
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
    redirect_back(fallback_location: root_path)
  end

  private

  def drive_comment_params
    params.require(:drive_comment).permit(:comment)
  end
end
