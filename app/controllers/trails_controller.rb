class TrailsController < ApplicationController
  def index
    @trails = Trail.all
    @hash = Gmaps4rails.build_markers(@trails) do |trail, marker|
      marker.lat trail.latitude
      marker.lng trail.longitude
      marker.title trail.name
    end
  end

  def show
    @trail = Trail.find(params[:id])

    #Maintenanceticket
    @maintenancetickets = @trail.maintenancetickets
    @maintenancetickets = @maintenancetickets.order(:completed)

    #Map
    @hash = Gmaps4rails.build_markers(@trail) do |trail, marker|
      marker.lat trail.latitude
      marker.lng trail.longitude
      marker.title trail.name
    end

    #Weather
    @weather_summary = ForecastIO.forecast(@trail.latitude, @trail.longitude).currently.summary.downcase
    @weather_temperature = ForecastIO.forecast(@trail.latitude, @trail.longitude).currently.temperature
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

  def edit


    @trail = Trail.find(params[:id])

    user_can_edit?
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

  def destroy
    @trail = Trail.find(params[:id])
    @trail.destroy
    redirect_to trails_path
    flash[:notice] = "Trail was deleted"
  end

  private

  def trail_params
    params.require(:trail).permit(:address, :latitude, :longitude, :length, :name, :description, :avatar, :creator_id)
  end

  def user_can_edit?
    unless current_user.id == @trail.creator_id || current_user.role == "admin"
      raise ActionController::RoutingError.new("You must be the trail's creator, or an admin, to edit this trail.")
    end
  end

  ForecastIO.configure do |configuration|
    configuration.api_key = '3005c7b585dcfef488065585a2bee2a3'
  end

end
