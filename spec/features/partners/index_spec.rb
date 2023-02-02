require 'rails_helper'

describe 'as a visitor' do
  describe "when i visit '/child_table_name'" do
    describe "i see each child in the system including the child's attributes" do

      it 'shows the childrens names' do
        sector_1 = Sector.create!(sector_name:'Retail', sufficient_staff: true, funding: 1000000)
        sector_2 = Sector.create!(sector_name:'Government', sufficient_staff: false, funding: 2000000)
        sector_3 = Sector.create!(sector_name:'Data Centers', sufficient_staff: false, funding: 4000000)
        sector_4 = Sector.create!(sector_name:'Education', sufficient_staff: true, funding: 1000000)

        partner_1 = Partner.create!(name:'IKEA', goal_achiever: false, sector_id: sector_1.id, btu_22: 534789025)
        partner_2 = Partner.create!(name:'City of Aurora', sector_id: sector_2.id,goal_achiever: true, btu_22: 209384)
        partner_3 = Partner.create!(name:'AWS', goal_achiever: false, sector_id: sector_3.id, btu_22: 67902799)
        partner_4 = Partner.create!(name:'University of Iowa', goal_achiever: true, sector_id: sector_4.id, btu_22: 7890626)

        visit '/partners'

        expect(page).to have_content(partner_1.name)
        expect(page).to have_content(partner_2.name)
        expect(page).to have_content(partner_3.name)
        expect(page).to have_content(partner_4.name)

      end

      it 'shows the childrens attributes' do
        sector_1 = Sector.create!(sector_name:'Retail', sufficient_staff: true, funding: 1000000)
        sector_2 = Sector.create!(sector_name:'Government', sufficient_staff: false, funding: 2000000)
        sector_3 = Sector.create!(sector_name:'Data Centers', sufficient_staff: false, funding: 4000000)
        sector_4 = Sector.create!(sector_name:'Education', sufficient_staff: true, funding: 1000000)

        partner_1 = Partner.create!(name:'IKEA', goal_achiever: false, sector_id: sector_1.id, btu_22: 534789025)
        partner_2 = Partner.create!(name:'City of Aurora', sector_id: sector_2.id,goal_achiever: true, btu_22: 209384)
        partner_3 = Partner.create!(name:'AWS', goal_achiever: false, sector_id: sector_3.id, btu_22: 67902799)
        partner_4 = Partner.create!(name:'University of Iowa', goal_achiever: true, sector_id: sector_4.id, btu_22: 7890626)

        visit "/partners"

        expect(page).to have_content(partner_1.goal_achiever)
        expect(page).to have_content(partner_1.updated_at)
        expect(page).to have_content(partner_1.created_at)
        expect(page).to have_content(partner_1.btu_22)

        expect(page).to have_content(partner_2.goal_achiever)
        expect(page).to have_content(partner_2.updated_at)
        expect(page).to have_content(partner_2.created_at)
        expect(page).to have_content(partner_2.btu_22)

        expect(page).to have_content(partner_3.goal_achiever)
        expect(page).to have_content(partner_3.updated_at)
        expect(page).to have_content(partner_3.created_at)
        expect(page).to have_content(partner_3.btu_22)

        expect(page).to have_content(partner_4.goal_achiever)
        expect(page).to have_content(partner_4.updated_at)
        expect(page).to have_content(partner_4.created_at)
        expect(page).to have_content(partner_4.btu_22)
      end
    end
  end
end