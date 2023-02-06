class SectorsController < ApplicationController
  def index
    @sectors = Sector.order_by_created
  end

  def show
    @sector = Sector.find(params[:id])
  end
end