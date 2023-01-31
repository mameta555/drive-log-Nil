class Public::DriveReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only:[:edit, :update, :destroy, :show]

  def new
    @drive_report = DriveReport.new
  end

  def create
    @drive_report = current_user.drive_reports.new(drive_report_params)
    if @drive_report.save
      redirect_to drive_report_routes_path(drive_report_id: @drive_report.id)
    else
      render :new
    end
  end

  def edit
    @drive_report = DriveReport.find(params[:id])
  end

  def update

    @drive_report = DriveReport.find(params[:id])
    if @drive_report.update(drive_report_params)
      redirect_to drive_report_path(@drive_report.id)
    else
      render :edit
    end
  end

  def index
    @drive_reports = current_user.drive_reports.all
  end

  def show
    @drive_report = DriveReport.find(params[:id])
  end
  def destroy
    @drive_report = DriveReport.find(params[:id])
    if @drive_report.destroy
      redirect_to drive_reports_path
    else
      render :index
    end
  end

  private

  def ensure_correct_user
    @drive_report = DriveReport.find(params[:id])
    unless @drive_report.user == current_user
      flash[:notice] = "他のユーザーのページには遷移できません"
      redirect_to drive_reports_path
    end
  end

  def drive_report_params
    params.require(:drive_report).permit(:title, :assessment).merge({status: params[:drive_report][:status].to_i})
  end
end
