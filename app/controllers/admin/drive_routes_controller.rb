class Admin::DriveRoutesController < ApplicationController
  def index
    @drive_routes = DriveRoute.page(params[:page]).per(9).order(created_at: :desc)
  end

end
