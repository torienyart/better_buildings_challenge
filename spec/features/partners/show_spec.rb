require 'rails_helper'

describe 'as a visitor' do
  describe "When I visit '/child_table_name/:id'" do
    it "I see the child with that id including the child's attributes"do
    @sector_1 = Sector.create!(sector_name:'Data Centers', sufficient_staff: true)
    partner_1 = Partner.create!(name:'IKEA', goal_achiever: false, sector_id: @sector_1.id)

    visit "/partners/#{partner_1.id}"
    
    expect(page).to have_content(partner_1.name)
    expect(page).to have_content(partner_1.goal_achiever)
    expect(page).to have_content(partner_1.sector_id)
    expect(page).to have_content(partner_1.created_at)
    expect(page).to have_content(partner_1.updated_at)

    end
  end
end