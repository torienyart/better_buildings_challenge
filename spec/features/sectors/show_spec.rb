require 'rails_helper'

describe 'as a visitor' do
  describe "when i visit '/parents/:id'" do
    describe "i see the parent with that id including the parent's attributes" do
      # let(:sector_1){Sector.create!(sector_name:'Data Centers', sufficient_staff: true)}
      # let(:sector_2){Sector.create!(sector_name:'Commercial Real Estate', sufficient_staff: false)}

      it 'shows the parent' do
        sector_1 = Sector.create!(sector_name:'Data Centers', sufficient_staff: true, funding: 1000000)
          visit "/sectors/#{sector_1.id}"

        expect(page).to have_content(sector_1.sector_name)
      end

      it 'shows the parents attributes' do
        sector_1 = Sector.create!(sector_name:'Data Centers', sufficient_staff: true, funding: 1000000)

        visit "/sectors/#{sector_1.id}"

        expect(page).to have_content(sector_1.funding)
        expect(page).to have_content(sector_1.sufficient_staff)
      end

      it 'shows a count of the number of children associated with this parent' do
        sector_1 = Sector.create!(sector_name:'Data Centers', sufficient_staff: true, funding: 1000000)
        partner_1 = Partner.create!(name:'Intuit', goal_achiever: false, sector_id: sector_1.id, btu_22: 534789025)
        partner_2 = Partner.create!(name:'Century Link', goal_achiever: false, sector_id: sector_1.id, btu_22: 457396)
        partner_3 = Partner.create!(name:'Intel Corporation', sector_id: sector_1.id,goal_achiever: true, btu_22: 209384)
        
        visit "/sectors/#{sector_1.id}"

        expect(page).to have_content('3')
      end
    end
    
    describe "I see a link to take me to that parent's `child_table_name` page" do
      it 'has a clickable link' do
        sector_1 = Sector.create!(sector_name:'Data Centers', sufficient_staff: true, funding: 1000000)
        partner_1 = Partner.create!(name:'Intuit', goal_achiever: false, sector_id: sector_1.id, btu_22: 534789025)
        partner_2 = Partner.create!(name:'Century Link', goal_achiever: false, sector_id: sector_1.id, btu_22: 457396)
        partner_3 = Partner.create!(name:'Intel Corporation', sector_id: sector_1.id,goal_achiever: true, btu_22: 209384)


        visit "/sectors/#{sector_1.id}"
        
        click_on "View #{sector_1.sector_name} Partners"

        expect(page.current_path).to eq("/sectors/#{sector_1.id}/partners")
      end
    end

    describe "I see a link to update the parent 'Update Parent'" do
      it 'has a clickable link' do
        sector_1 = Sector.create!(sector_name:'Data Centers', sufficient_staff: true, funding: 1000000)
        partner_1 = Partner.create!(name:'Intuit', goal_achiever: false, sector_id: sector_1.id, btu_22: 534789025)
        partner_2 = Partner.create!(name:'Century Link', goal_achiever: false, sector_id: sector_1.id, btu_22: 457396)
        partner_3 = Partner.create!(name:'Intel Corporation', sector_id: sector_1.id,goal_achiever: true, btu_22: 209384)


        visit "/sectors/#{sector_1.id}"
        
        click_on "Update Sector"

        expect(page.current_path).to eq("/sectors/#{sector_1.id}/edit")
      end
    end
  end
end