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
    drive_route.update(drive_route_params)
    redirect_to drive_route_path(drive_route.id)
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
    params.require(:drive_route).permit(:title, :image, :body, tag_ids: [])
  end
end
