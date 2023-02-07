require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit '/parents/:parent_id/child_table_name'" do
    describe "Then I see each Child that is associated with that Parent with each Child's attributes" do
      it 'has partner names' do
        sector_1 = Sector.create!(sector_name:'Retail', sufficient_staff: true, funding: 1000000)
        partner_1 = Partner.create!(name:'IKEA', goal_achiever: false, sector_id: sector_1.id, btu_22: 3499923)
        partner_2 = Partner.create!(name:"Khols's", goal_achiever: false, sector_id: sector_1.id, btu_22: 457396)
        sector_2 = Sector.create!(sector_name:'Government', sufficient_staff: false, funding: 2000000)
        partner_3 = Partner.create!(name:'City of Aurora', sector_id: sector_2.id,goal_achiever: true, btu_22: 209384)

        visit "/sectors/#{sector_1.id}/partners"

        expect(page).to have_content(partner_1.name)
        expect(page).to have_content(partner_2.name)
      end

      it 'has partner attributes' do
        sector_1 = Sector.create!(sector_name:'Retail', sufficient_staff: true, funding: 1000000)
        partner_1 = Partner.create!(name:'IKEA', goal_achiever: false, sector_id: sector_1.id, btu_22: 3499923)
        partner_2 = Partner.create!(name:"Khols's", goal_achiever: false, sector_id: sector_1.id, btu_22: 457396)
        sector_2 = Sector.create!(sector_name:'Government', sufficient_staff: false, funding: 2000000)
        partner_3 = Partner.create!(name:'City of Aurora', sector_id: sector_2.id,goal_achiever: true, btu_22: 209384)

        visit "/sectors/#{sector_1.id}/partners"

        expect(page).to have_content(partner_1.goal_achiever)
        expect(page).to have_content(partner_1.updated_at)
        expect(page).to have_content(partner_1.created_at)
        expect(page).to have_content(partner_1.btu_22)


        expect(page).to have_content(partner_2.goal_achiever)
        expect(page).to have_content(partner_2.updated_at)
        expect(page).to have_content(partner_2.created_at)
        expect(page).to have_content(partner_2.btu_22)
      end

      it 'has a link to create a new adoptable child for that parent' do
        sector_1 = Sector.create!(sector_name:'Retail', sufficient_staff: true, funding: 1000000)
        partner_1 = Partner.create!(name:'IKEA', goal_achiever: false, sector_id: sector_1.id, btu_22: 3499923)
        partner_2 = Partner.create!(name:"Khols's", goal_achiever: false, sector_id: sector_1.id, btu_22: 457396)
        sector_2 = Sector.create!(sector_name:'Government', sufficient_staff: false, funding: 2000000)
        partner_3 = Partner.create!(name:'City of Aurora', sector_id: sector_2.id,goal_achiever: true, btu_22: 209384)

        visit "/sectors/#{sector_1.id}/partners"

        expect(page).to have_link('Track New Partner')

        click_link 'Track New Partner'

        expect(page.current_path).to eq("/sectors/#{sector_1.id}/partners/new")
      end

    end
  end
end