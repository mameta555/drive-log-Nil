class Public::RoutesController < ApplicationController
  before_action :authenticate_user!
  # before_action :ensure_correct_user

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

  def new
    #byebug
    @drive_report = DriveReport.find(params[:drive_report_id])
    @route = Route.new
  end

  def drive
    @drive_report = DriveReport.find(params[:drive_report_id])
    @route = current_user.routes.new(route_params)
    @route.drive_report_id = @drive_report.id
    if @route.save
      redirect_to drive_report_routes_path(@drive_report.id)
    else
      render :new
    end
  end

  def erase
    @route = Route.find(params[:id])
    @drive_report = DriveReport.find(params[:drive_report_id])
    if @route.destroy
      redirect_to drive_report_routes_path(@drive_report.id)
    else
      render :new
    end
  end

  private

  def route_params
    params.require(:route).permit(:destination, :destination_memo, :status, :destination_image)
  end

  # def ensure_correct_user
  #   drive_route = DriveRoute.find(params[:drive_route_id])
  #   drive_report = DriveReport.find(params[:drive_route_id])
  #   unless drive_route.user == current_user || drive_report.user == current_user
  #     redirect_back fallback_location: root_path
  #   end
  # end
end
