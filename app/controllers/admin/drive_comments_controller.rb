class Admin::DriveCommentsController < ApplicationController
  before_action :authenticate_user!
  def destroy
    comment = DriveComment.find(params[:id])
    comment.destroy
    redirect_back(fallback_location: root_path)
  end

end
