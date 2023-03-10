require 'rails_helper'

describe 'as a visitor' do
  describe "When I visit '/child_table_name/:id'" do
    it "I see the child with that id including the child's attributes"do
      @sector_1 = Sector.create!(sector_name:'Data Centers', sufficient_staff: true, funding: 1000000)
      partner_1 = Partner.create!(name:'IKEA', goal_achiever: false, sector_id: @sector_1.id, btu_22: 235789000)

      visit "/partners/#{partner_1.id}"
      
      expect(page).to have_content(partner_1.name)
      expect(page).to have_content(partner_1.goal_achiever)
      expect(page).to have_content(partner_1.sector_id)
      expect(page).to have_content(partner_1.created_at)
      expect(page).to have_content(partner_1.updated_at)
      expect(page).to have_content(partner_1.btu_22)
    end 

    it "I see a link to update that Child 'Update Child'" do
      @sector_1 = Sector.create!(sector_name:'Data Centers', sufficient_staff: true, funding: 1000000)
      partner_1 = Partner.create!(name:'IKEA', goal_achiever: false, sector_id: @sector_1.id, btu_22: 235789000)

      visit "/partners/#{partner_1.id}"

      expect(page).to have_link('Update Partner')

      click_link 'Update Partner'

      expect(page.current_path).to eq("/partners/#{partner_1.id}/edit")
    end
  end
end