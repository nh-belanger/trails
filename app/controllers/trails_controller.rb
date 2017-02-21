class TrailsController < ApplicationController
  def index
    @trails = Trail.all
  end

  def show
    @trail = Trail.find(params[:id])
  end

  def new
    @trail = Trail.new
  end

  def create
    @trail = Trail.new(trail_params)
    if @trail.save
      flash[:notice] = "Trail created!"
      redirect_to trails_path
    else
      flash[:alert] = "Trail not created"
      render :new
    end
  end

  def update
    @trail = Trail.find(params[:id])
    @trail.update_attributes(trail_params)
    if @trail.save
      flash[:notice] = "Nothing bad happened :)"
      redirect_to trails_path
    else
      flash[:alert] = "Something went wrong"
      render :show
    end
  end

  private

  def trail_params
    params.require(:trail).permit(:address, :trailhead_lat, :trailhead_long, :length, :name)
  end
end
