class Public::RoutesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user

  def create
    @drive_route = DriveRoute.find(params[:drive_route_id])
    @route = current_user.routes.new(route_params)
    @route.drive_route_id = @drive_route.id
    if @route.save
      redirect_to drive_route_routes_path(@drive_route.id)
    else
      render :index
    end
  end

  def index
    @drive_route = DriveRoute.find(params[:drive_route_id])
    @route = Route.new
  end

  def destroy
    @route = Route.find(params[:id])
    if @route.destroy
      drive_route = DriveRoute.find(params[:drive_route_id])
      redirect_to drive_route_routes_path(drive_route.id)
    else
      render :index
    end
  end

  private

  def route_params
    params.require(:route).permit(:destination, :destination_memo, :status, :destination_image)
  end

  def ensure_correct_user
    drive_route = DriveRoute.find(params[:drive_route_id])
    #@routes = Route.all
    unless drive_route.user == current_user
      redirect_to drive_route_path(drive_route.id)
    end
  end
end
