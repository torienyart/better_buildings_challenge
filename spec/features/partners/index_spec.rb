require 'rails_helper'

describe 'as a visitor' do
  describe "when i visit '/child_table_name'" do
    describe "i see each child in the system including the child's attributes" do

      it 'shows the childrens names' do
        partner_1 = Partner.create!(name:'IKEA', goal_achiever: false)
        partner_2 = Partner.create!(name:'City of Aurora', goal_achiever: true)
        partner_3 = Partner.create!(name:'AWS', goal_achiever: false)
        partner_4 = Partner.create!(name:'University of Iowa', goal_achiever: true)

        visit '/partners'

        expect(page).to have_content(partner_1.name)
        expect(page).to have_content(partner_2.name)
        expect(page).to have_content(partner_3.name)
        expect(page).to have_content(partner_4.name)

      end

      it 'shows the childrens attributes' do
        partner_1 = Partner.create!(name:'IKEA', goal_achiever: false)
        partner_2 = Partner.create!(name:'City of Aurora', goal_achiever: true)
        partner_3 = Partner.create!(name:'AWS', goal_achiever: false)
        partner_4 = Partner.create!(name:'University of Iowa', goal_achiever: true)


        visit "/partners"

        expect(page).to have_content(partner_1.goal_achiever)
        expect(page).to have_content(partner_1.updated_at)
        expect(page).to have_content(partner_1.created_at)

        expect(page).to have_content(partner_2.goal_achiever)
        expect(page).to have_content(partner_2.updated_at)
        expect(page).to have_content(partner_2.created_at)

        expect(page).to have_content(partner_3.goal_achiever)
        expect(page).to have_content(partner_3.updated_at)
        expect(page).to have_content(partner_3.created_at)

        expect(page).to have_content(partner_4.goal_achiever)
        expect(page).to have_content(partner_4.updated_at)
        expect(page).to have_content(partner_4.created_at)


      end
    end
  end
end