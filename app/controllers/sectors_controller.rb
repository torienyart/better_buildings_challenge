class SectorsController < ApplicationController
  def index
    @sectors = Sector.order_by_created
  end

  def show
    @sector = Sector.find(params[:id])
  end

  def create
    @new_sector = Sector.create(sector_params)
    redirect_to "/sectors"
  end

  def edit
    @sector = Sector.find(params[:id])
  end

  def update
    sector = Sector.find(params[:id])
    sector.update(sector_params)
    redirect_to "/sectors/#{sector.id}"
  end

  private
  def sector_params
    params.permit(:sector_name, :sufficient_staff, :funding)
  end
end