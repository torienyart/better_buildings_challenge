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

  describe 'show page methods' do
    it 'can count the number of partners belonging to a sector' do
      sector_1 = Sector.create!(sector_name:'Data Centers', sufficient_staff: true, funding: 1000000)
      partner_1 = Partner.create!(name:'Intuit', goal_achiever: false, sector_id: sector_1.id, btu_22: 534789025)
      partner_2 = Partner.create!(name:'Century Link', goal_achiever: false, sector_id: sector_1.id, btu_22: 457396)
      partner_3 = Partner.create!(name:'Intel Corporation', sector_id: sector_1.id,goal_achiever: true, btu_22: 209384)
      expect(sector_1.partner_count).to eq(3)
    end
  end
end