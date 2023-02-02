class SectorPartnersController < ApplicationController
  def index
    @sector = Sector.find(params[:id])
    @partners = @sector.partners
  end
end