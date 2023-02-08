require 'rails_helper'

describe 'Create a new instance of partner w/ new page' do
  it 'can provide a working form that updates the index page' do
    sector_1 = Sector.create!(sector_name:'Retail', sufficient_staff: true, funding: 1000000)
    partner_1 = Partner.create!(name:'IKEA', goal_achiever: false, sector_id: sector_1.id, btu_22: 534789025)
    partner_2 = Partner.create!(name:"Khols's", goal_achiever: false, sector_id: sector_1.id, btu_22: 457396)
        
    visit "/sectors/#{sector_1.id}/partners/new"
  
    fill_in('Name', with: "Wendy's")
    choose("goal_achiever_false")
    fill_in('btu_22', with: '30547832')
    click_button('Create Partner')
  
    expect(current_path).to eq("/sectors/#{sector_1.id}/partners")
    
    expect(page).to have_content("Wendy's")
  end
end