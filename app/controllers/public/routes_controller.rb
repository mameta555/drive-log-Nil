class Public::RoutesController < ApplicationController
  def create
    drive_route = DriveRoute.find(params[:drive_route_id])
    route = current_user.routes.new(route_params)
    route.drive_route_id = drive_route.id
    route.save
    redirect_to drive_route_routes_path(drive_route_id)
  end

  def index
    @drive_route = DriveRoute.find(params[:drive_route_id])
    @route = Route.new
  end

  private

  def route_params
    params.require(:route).permit(:destination, :destination_memo, :status, :route_image)
  end
end
