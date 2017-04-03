class MaintenanceticketsController < ApplicationController
  def index
    @maintenancetickets = Maintenanceticket.all
  end

  def show
    @trail = Trail.find(params[:trail_id])
    @maintenanceticket = Maintenanceticket.find(params[:id])
  end

  def mark_completed
    @trail = Trail.find(params[:trail_id])
    @maintenanceticket = Maintenanceticket.find(params[:id])
    @maintenanceticket.completed = true
    @maintenanceticket.save
    if @maintenanceticket.completed == true
      flash[:notice] = "Maintenance ticket marked as completed. Good work!"
      redirect_to trail_path(@trail)
    else
      flash[:notice] = "Something went wrong!"
      redirect_to trail_path(@trail)
    end
  end


  def new

    user_can_create?

    @trail = Trail.find(params[:trail_id])
    @maintenanceticket = Maintenanceticket.new
  end

  def destroy
    @trail = Trail.find(params[:trail_id])
    @maintenanceticket = Maintenanceticket.find(params[:id])
    @maintenanceticket.destroy
    redirect_to trail_path(@trail)
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
    @trail = Trail.find(params[:trail_id])
    @maintenanceticket = Maintenanceticket.find(params[:id])
    @maintenanceticket.update_attributes(maintenanceticket_params)
    if @maintenanceticket.save
      flash[:notice] = "Maintenance ticket was updated."
      redirect_to trail_maintenanceticket_path
    else
      flash[:alert] = "Unable to edit."
      render :show
    end
  end

  def edit
    @trail = Trail.find(params[:trail_id])
    @maintenanceticket = Maintenanceticket.find(params[:id])
  end

  private

  def maintenanceticket_params
    params.require(:maintenanceticket).permit(:location, :body, :trail_id, :completed)
  end

  def user_can_create?
    unless user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
