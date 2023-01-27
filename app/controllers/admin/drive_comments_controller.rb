class Admin::DriveCommentsController < ApplicationController
  before_action :authenticate_admin!
  def destroy
    @comment = DriveComment.find(params[:id])
    @comment.destroy
    redirect_to admin_drive_route_path(params[:drive_route_id])
  end

end
