require 'rails_helper'

describe 'As a visitor' do
  describe "when i visit '/parents'" do
    it 'i see the name of each parent record in the system' do
      sector_1 = Sector.create!(sector_name:'Data Centers', sufficient_staff: true)
      sector_2 = Sector.create!(sector_name:'Commercial Real Estate', sufficient_staff: false)

      visit '/sectors'

      expect(page).to have_content(sector_1.sector_name)
      expect(page).to have_content(sector_2.sector_name)
    end
  end

end