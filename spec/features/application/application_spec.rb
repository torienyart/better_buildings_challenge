require 'rails_helper'

describe 'application view' do
  describe 'partners link' do
    it 'shows the partners index page link on every page' do
      sector_1 = Sector.create!(sector_name:'Data Centers', sufficient_staff: true, funding: 1000000)
      partner_1 = Partner.create!(name:'Intuit', goal_achiever: false, sector_id: sector_1.id, btu_22: 534789025)

      visit '/sectors'

      expect(page).to have_link('Partners')

      visit "/sectors/#{sector_1.id}"

      expect(page).to have_link('Partners')

      visit '/partners'

      expect(page).to have_link('Partners')

      visit "/partners/#{partner_1.id}"

      expect(page).to have_link('Partners')
    end
    
    it 'routes to the partners page' do
      sector_1 = Sector.create!(sector_name:'Data Centers', sufficient_staff: true, funding: 1000000)
      partner_1 = Partner.create!(name:'Intuit', goal_achiever: false, sector_id: sector_1.id, btu_22: 534789025)

      visit '/sectors'

      click_on 'Partners'

      expect(page.current_path).to eq('/partners')
    end
  end

  describe 'sectors link' do
    it 'shows the sectors index page link on every page' do
      sector_1 = Sector.create!(sector_name:'Data Centers', sufficient_staff: true, funding: 1000000)
      partner_1 = Partner.create!(name:'Intuit', goal_achiever: false, sector_id: sector_1.id, btu_22: 534789025)
  
      visit '/sectors'
  
      expect(page).to have_link('Sectors')
  
      visit "/sectors/#{sector_1.id}"
  
      expect(page).to have_link('Sectors')
  
      visit '/partners'
  
      expect(page).to have_link('Sectors')
  
      visit "/partners/#{partner_1.id}"
  
      expect(page).to have_link('Sectors')
    end
    
    it 'routes to the partners page' do
      sector_1 = Sector.create!(sector_name:'Data Centers', sufficient_staff: true, funding: 1000000)
      partner_1 = Partner.create!(name:'Intuit', goal_achiever: false, sector_id: sector_1.id, btu_22: 534789025)
  
      visit '/partners'
  
      click_on 'Sectors'
  
      expect(page.current_path).to eq('/sectors')
    end
  end
end