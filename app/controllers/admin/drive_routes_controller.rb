class Admin::DriveRoutesController < ApplicationController
  def index
    @drive_routes = DriveRoute.page(params[:page]).per(9).order(created_at: :desc)
  end

  def show
    @drive_route = DriveRoute.find(params[:id])
  end

  def destroy
    @drive_route = DriveRoute.find(params[:id])
    @drive_route.destroy
    redirect_to admin_drive_routes_path
  end
end
