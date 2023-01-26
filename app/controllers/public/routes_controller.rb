class Public::RoutesController < ApplicationController
  before_action :authenticate_user!
  

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
    unless @drive_route.user_id == current_user.id
      redirect_to drive_route_path(@drive_route.id)
    end
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

  # ドライブレポートの行き先入力・一覧画面
  def new
    @drive_report = DriveReport.find(params[:drive_report_id])
    unless @drive_report.user.id == current_user.id
      redirect_to drive_reports_path
    end
    @route = Route.new
  end

  # ドライブレポートの行き先作成アクション
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

  # ドライブレポートの行き先のレコード削除アクション
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

 
end
