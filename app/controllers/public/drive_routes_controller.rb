class Public::DriveRoutesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :search, :index]
  before_action :ensure_correct_user, only: [:edit, :update]

  def new
    @drive_route = DriveRoute.new
    @drive_route.routes.build
  end

  def create
    @drive_route = current_user.drive_routes.build(drive_route_params)
    if @drive_route.save
      redirect_to drive_route_path(@drive_route)
    else
      render :new
    end
  end

  def index
    # @drive_routes = params[:tag_id].present? ? Tag.find(params[:tag_id]).drive_routes : DriveRoute.page(params[:page]).per(6).order(created_at: :desc)
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
    @drive_comment = DriveComment.new
  end

  def edit
    @drive_route = DriveRoute.find(params[:id])
  end

  def update
    drive_route = DriveRoute.find(params[:id])
    if drive_route.update(drive_route_params)
      redirect_to drive_route_path(drive_route.id)
    else
      render edit
    end
  end

  def destroy
    @drive_route = DriveRoute.find(params[:id])
    @drive_route.destroy
    redirect_to drive_routes_path
  end

  def search
    @tags = Tag.all
    @keyword = params[:keyword]
    @drive_routes = DriveRoute.search(params[:keyword]).page(params[:page]).per(9)
    render "index"
  end

  private
# 投稿一つにつきタグは複数なのでtag_idsと複数形
  def drive_route_params
    params.require(:drive_route).permit(:title, :image, :body, tag_ids: [],
      routes_attributes: [:id, :destination_image, :destination, :destination_memo, :lat, :lng, :_destroy])
  end

  def ensure_correct_user
    @drive_route = DriveRoute.find(params[:id])
    unless @drive_route.user == current_user
      redirect_to drive_route_path(@drive_route)
    end
  end
end
