require 'rails_helper'

describe 'update partner' do
  it 'can update the partner' do
    sector_1 = Sector.create!(sector_name:'Data Centers', sufficient_staff: true, funding: 1000000)
    partner_1 = Partner.create!(name:'IKEA', goal_achiever: false, sector_id: sector_1.id, btu_22: 534789025)

    visit "/partners/#{partner_1.id}"

    expect(page).to have_content('false')

    click_link 'Update Partner'

    choose("goal_achiever_true")
    click_button('Update Partner')

    expect(current_path).to eq("/partners/#{partner_1.id}")
    expect(page).to have_content('true')
  end
end