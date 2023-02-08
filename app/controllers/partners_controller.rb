class PartnersController < ApplicationController
  def index
    @partners = Partner.all
  end

  def show
    @partner = Partner.find(params[:id])
  end

  def edit
    @partner = Partner.find(params[:id])
  end

  def update
    partner = Partner.find(params[:id])
    partner.update(partner_params)
    redirect_to "/partners/#{partner.id}"
  end


  private
  def partner_params
    params.permit(:name, :goal_achiever, :btu_22)
  end
end