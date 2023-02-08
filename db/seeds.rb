# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# sector_1 = Sector.create!(sector_name:'Data Centers', sufficient_staff: true)
# sector_2 = Sector.create!(sector_name:'Commercial Real Estate', sufficient_staff: false)
# sector_3 = Sector.create!(sector_name:'Commercial Real Estate', sufficient_staff: false)




sector_1 = Sector.create!(sector_name:'Retail', sufficient_staff: true, funding: 1000000)
sector_2 = Sector.create!(sector_name:'Government', sufficient_staff: false, funding: 2000000)
sector_3 = Sector.create!(sector_name:'Data Centers', sufficient_staff: false, funding: 4000000)
sector_4 = Sector.create!(sector_name:'Education', sufficient_staff: true, funding: 1000000)

partner_1 = Partner.create!(name:'IKEA', goal_achiever: false, sector_id: sector_1.id, btu_22: 534789025)
partner_2 = Partner.create!(name:"Khols's", goal_achiever: false, sector_id: sector_1.id, btu_22: 457396)
partner_3 = Partner.create!(name:'City of Aurora', sector_id: sector_2.id,goal_achiever: true, btu_22: 209384)
partner_4 = Partner.create!(name:'AWS', goal_achiever: false, sector_id: sector_3.id, btu_22: 67902799)
partner_5 = Partner.create!(name:'University of Iowa', goal_achiever: true, sector_id: sector_4.id, btu_22: 7890626)


