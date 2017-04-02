class PagesController < ApplicationController
  def show
    render template: "pages/#{params[:page]}"

    @maintenancetickets = Maintenanceticket.all
  end
end
