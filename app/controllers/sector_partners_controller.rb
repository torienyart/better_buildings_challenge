class SectorPartnersController < ApplicationController
  def index
    @sector = Sector.find(params[:id])
    @partners = @sector.partners
  end

  def new
    @sector = Sector.find(params[:id])
  end

  def create
    sector = Sector.find(params[:id])
    @new_partner = sector.partners.create(partner_params)
    redirect_to "/sectors/#{sector.id}/partners"
  end


  
  private

  def partner_params
    params.permit(:name, :goal_achiever, :btu_22)
  end
end