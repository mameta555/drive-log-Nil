class Public::HomesController < ApplicationController
  def top
    @tags = Tag.all
    @drive_routes = DriveRoute.page(params[:page]).per(3).order(created_at: :desc)
  end
  def about
  end
end
