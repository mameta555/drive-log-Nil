class Public::LikesController < ApplicationController
  def index
  end
  
  def create
    drive_route = DriveRoute.find(params[:drive_route_id])
    like = current_user.likes.new(drive_route_id: drive_route.id)
    like.save
    redirect_to drive_route_path(drive_route)
  end
  
  def destroy
    drive_route = DriveRoute.find(params[:drive_route_id])
    like = current_user.likes.find_by(drive_route_id: drive_route.id)
    like.destroy
    redirect_to drive_route_path(drive_route)
  end
end
