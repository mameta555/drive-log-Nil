class Public::DriveRoutesController < ApplicationController
  def new
    @drive_route = DriveRoute.new
    @route = Route.new
  end

  def create
    @drive_route = DriveRoute.new(drive_route_params)
    @drive_route.user_id = current_user.id
    @drive_route.save
    redirect_to drive_route_routes_path(@drive_route.id)
  end

  def index
    @drive_routes = DriveRoute.all.order(created_at: :desc)
  end

  def show
    @drive_route = DriveRoute.find(params[:id])
    
  end

  def edit
    @drive_route = DriveRoute.find(params[:id])
  end

  def update
    drive_route = DriveRoute.find(params[:id])
    drive_route.update(drive_route_params)
    redirect_to drive_route_path(drive_route.id)
  end

  def destroy
    @drive_route = DriveRoute.find(params[:id])
    @drive_route.destroy
    redirect_to drive_routes_path
  end

  private

  def drive_route_params
    params.require(:drive_route).permit(:title, :image, :body, tag_name_ids: [])
  end
end
