require 'rails_helper'

describe 'as a visitor' do
  describe "when i visit '/parents/:id'" do
    describe "i see the parent with that id including the parent's attributes" do
      # let(:sector_1){Sector.create!(sector_name:'Data Centers', sufficient_staff: true)}
      # let(:sector_2){Sector.create!(sector_name:'Commercial Real Estate', sufficient_staff: false)}

      it 'shows the parent' do
        sector_1 = Sector.create!(sector_name:'Data Centers', sufficient_staff: true)
        visit "/sectors/#{sector_1.id}"

        expect(page).to have_content(sector_1.sector_name)
      end

      it 'shows the parents attributes' do
        sector_1 = Sector.create!(sector_name:'Data Centers', sufficient_staff: true)

        visit "/sectors/#{sector_1.id}"

        expect(page).to have_content(sector_1.created_at)
        expect(page).to have_content(sector_1.updated_at)
        expect(page).to have_content(sector_1.sufficient_staff)

      end
    end
  end
end