require 'rails_helper'

RSpec.describe Sector do
  it {should have_many :partners}

  describe 'index page methods' do
    it 'can order sectors on index page by most recently created first' do
      sector_1 = Sector.create!(sector_name:'Retail', sufficient_staff: true, funding: 1000000)
      sector_3 = Sector.create!(sector_name:'Government', sufficient_staff: false, funding: 2000000)
      sector_2 = Sector.create!(sector_name:'Data Centers', sufficient_staff: false, funding: 4000000)
      sector_4 = Sector.create!(sector_name:'Education', sufficient_staff: true, funding: 1000000)

      expect(Sector.order_by_created.first).to eq(sector_4)
      expect(Sector.order_by_created.last).to eq(sector_1)

    end
  end
end