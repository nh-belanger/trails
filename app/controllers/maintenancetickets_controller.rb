class MaintenanceticketsController < ApplicationController
  def index
    @maintenancetickets = Maintenanceticket.all
  end

  def show
    @maintenanceticket = Maintenanceticket.find(params[:id])
  end

  def new
    @maintenanceticket = Maintenanceticket.new
  end

  def create
    @maintenanceticket = Maintenanceticket.new(user_params)
    if @maintenanceticket.save
      flash[:notice] = "Maintenance ticket created!"
      redirect_to maintenancetickets_path
    else
      flash[:alert] = "Maintenance ticket not created"
      render :new
    end
  end

  def update
    @maintenanceticket = Maintenanceticket.find(params[:id])
    @maintenanceticket.update_attributes(user_params)
    if @maintenanceticket.save
      flash[:notice] = "Nothing bad happened :)"
      redirect_to users_path
    else
      flash[:alert] = "Something went wrong"
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
