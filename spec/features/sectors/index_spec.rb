require 'rails_helper'

describe 'As a visitor' do
  describe "when i visit '/parents'" do
    it 'i see the name of each parent record in the system' do
      sector_1 = Sector.create!(sector_name:'Data Centers', sufficient_staff: true, funding: 1000000)
      sector_2 = Sector.create!(sector_name:'Commercial Real Estate', sufficient_staff: false, funding: 2000000)

      visit '/sectors'

      expect(page).to have_content(sector_1.sector_name)
      expect(page).to have_content(sector_2.sector_name)
    end

    it 'I see that records are ordered by most recently created first' do
      sector_2 = Sector.create!(sector_name:'Data Centers', sufficient_staff: true, funding: 1000000)
      sector_1 = Sector.create!(sector_name:'Commercial Real Estate', sufficient_staff: false, funding: 2000000)
      sector_3 = Sector.create!(sector_name:'Higher Education', sufficient_staff: false, funding: 100000)

      visit '/sectors'

      expect(sector_3.sector_name).to appear_before(sector_1.sector_name)
      expect(sector_1.sector_name).to appear_before(sector_2.sector_name)
    end

    it 'And next to each of the records I see when it was created' do
      sector_1 = Sector.create!(sector_name:'Data Centers', sufficient_staff: true, funding: 1000000)
      sector_2 = Sector.create!(sector_name:'Commercial Real Estate', sufficient_staff: false, funding: 2000000)
      sector_3 = Sector.create!(sector_name:'Higher Education', sufficient_staff: false, funding: 100000)

      visit '/sectors'

      expect(page).to have_content(sector_1.created_at)
      expect(page).to have_content(sector_2.created_at)
      expect(page).to have_content(sector_3.created_at)

    end

    it "I see a link to create a new Parent record, 'New Parent'" do
      sector_1 = Sector.create!(sector_name:'Data Centers', sufficient_staff: true, funding: 1000000)
      sector_2 = Sector.create!(sector_name:'Commercial Real Estate', sufficient_staff: false, funding: 2000000)
      sector_3 = Sector.create!(sector_name:'Higher Education', sufficient_staff: false, funding: 100000)

      visit '/sectors'
      
      expect(page).to have_link('Create a Sector')
    end

    it "the link takes me to '/parents/new' where I  see a form for a new parent record" do
      sector_1 = Sector.create!(sector_name:'Data Centers', sufficient_staff: true, funding: 1000000)
      sector_2 = Sector.create!(sector_name:'Commercial Real Estate', sufficient_staff: false, funding: 2000000)
      sector_3 = Sector.create!(sector_name:'Higher Education', sufficient_staff: false, funding: 100000)

      visit '/sectors'

      click_on 'Create a Sector'

      expect(page.current_path).to eq('/sectors/new')
    end
  end

end