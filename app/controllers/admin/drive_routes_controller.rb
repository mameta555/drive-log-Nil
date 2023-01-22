class Admin::DriveRoutesController < ApplicationController
  def index
    @tags = Tag.all
    if params[:tag_id]
      @tag = Tag.find(params[:tag_id])
      @drive_routes = @tag.drive_routes.page(params[:page]).per(9).order(created_at: :desc)
    else
       @drive_routes = DriveRoute.page(params[:page]).per(9).order(created_at: :desc)
    end
  end

  def show
    @drive_route = DriveRoute.find(params[:id])
  end

  def destroy
    @drive_route = DriveRoute.find(params[:id])
    @drive_route.destroy
    redirect_to admin_drive_routes_path
  end

  def search
    @tags = Tag.all
    @keyword = params[:keyword]
    @drive_routes = DriveRoute.search(params[:keyword]).page(params[:page]).per(9)
    render "index"
  end
end
