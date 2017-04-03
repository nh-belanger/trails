class MaintenanceticketsController < ApplicationController
  def index
    @maintenancetickets = Maintenanceticket.all
  end

  def show
    @maintenanceticket = Maintenanceticket.find(params[:id])
  end

  def new

    user_can_create?

    @trail = Trail.find(params[:trail_id])
    @maintenanceticket = Maintenanceticket.new
  end

  def destroy
    @maintenanceticket = Maintenanceticket.find(params[:id])
    @maintenanceticket.destroy
    redirect_to trail_maintenancetickets_path
    flash[:notice] = "Ticket was Deleted"
  end

  def create

  user_can_create?

    @maintenanceticket = Maintenanceticket.new(maintenanceticket_params)
    @trail = Trail.find(params[:trail_id])
    if @maintenanceticket.save!
      # Says trail must exist??
      flash[:notice] = "Maintenance ticket created!"
      redirect_to trail_path(@trail)
    else
      flash[:alert] = "Maintenance ticket not created"
      render :new
    end
  end

  def update
    @maintenanceticket = Maintenanceticket.find(params[:id])
    @maintenanceticket.update_attributes(maintenanceticket_params)
    if @maintenanceticket.save
      flash[:notice] = "Nothing bad happened :)"
      redirect_to trail_maintenanceticket_path
    else
      flash[:alert] = "Something went wrong"
      render :show
    end
  end

  private

  def maintenanceticket_params
    params.require(:maintenanceticket).permit(:location, :body, :trail_id)
  end

  def user_can_create?
    unless user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
