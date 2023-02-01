class SectorsController < ApplicationController
  def index
    @sectors = Sector.all
  end
end