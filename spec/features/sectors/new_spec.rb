require 'rails_helper' 

describe 'Sector Creation' do
  it 'can create a new sector' do
    sector_1 = Sector.create!(sector_name:'Data Centers', sufficient_staff: true, funding: 1000000)
    sector_2 = Sector.create!(sector_name:'Commercial Real Estate', sufficient_staff: false, funding: 2000000)
    sector_3 = Sector.create!(sector_name:'Higher Education', sufficient_staff: false, funding: 100000)

    visit '/sectors/new'
  
    fill_in('Sector name', with: 'Government')
    choose("sufficient_staff_true")
    fill_in('Funding', with: '30000000')
    click_button('Create Sector')
  
    expect(current_path).to eq("/sectors")
    
    expect(page).to have_content("Government")
  end
end
