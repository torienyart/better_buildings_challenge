require 'rails_helper'

RSpec.describe 'update sector' do
  it 'can update the sector' do
    sector_1 = Sector.create!(sector_name:'Data Cent', sufficient_staff: false, funding: 1000000)

    visit "/sectors/#{sector_1.id}"

    expect(page).to have_content('Data Cent')

    click_link 'Update Sector'

    fill_in('Sector name', with: 'Data Centers')
    choose("sufficient_staff_true")
    click_button('Update Sector')

    expect(current_path).to eq("/sectors/#{sector_1.id}")
    expect(page).to have_content('Data Centers')
  end
end