User.destroy_all
u1 = User.create :email => 'user1@test.com', :password => 'chicken', :location => 'Chotswood', :admin => true
u2 = User.create :email => 'user2@test.com', :password => 'chicken', :location => 'Ultimo'
puts "#{ User.count } users"

Grill.destroy_all
g1 = Grill.create :name => "Webber Premium Q 2,000", :location => 'Chotswood', :price_per_day => 50 , :image => 'https://www.heatingandoutdoors.com.au/wp-content/uploads/2017/08/Q2200Titanium.jpg'
g2 = Grill.create :name => "Alfresco Standard Cart Grill ALXE-56BFGR", :location => 'Newtown', :price_per_day => 100 , :image => 'https://alfrescogrills.com/wp-content/uploads/2018/11/56-bfg.jpg'
g3 = Grill.create :name => "Kalamazoo K1000HS Hybrid Fire Grill", :location => 'Burwood', :price_per_day => 150 , :image => 'https://d12mivgeuoigbq.cloudfront.net/magento-media/catalog/product/c/2/c21c4da9-2068-45a4-a955-18e149eb8a29.jpg?w=640'
g4 = Grill.create :name => 'Fire Magic Echelon Diamond Grill', :location => 'Ultimo', :price_per_day => 350 , :image => 'https://www.barbequesgalore.com.au/dw/image/v2/BDXZ_PRD/on/demandware.static/-/Sites-bbqg-master-catalog/default/dwf9ea28aa/images/FMEDP-62-1060S/FMEDP-62-1060S_01.jpg?sw=635&sh=508'
puts "#{ Grill.count } grills"

Booking.destroy_all
b1 = Booking.create :date => '2023-01-23', :location => 'Ultimo'
b2 = Booking.create :date => '2023-02-21', :location => 'Chatswood'
b3 = Booking.create :date => '2023-03-12', :location => 'Surry Hills'
b4 = Booking.create :date => '2023-04-28', :location => 'Newtown'
puts "#{ Booking.count } bookings"

# Associations
puts "Grills and users"
u1.grills << g1 << g2
u1.grills << g2


puts "Bookings and grills"
g1.bookings << b1 << b2
g2.bookings << b3


puts "Bookings and Users"
u1.bookings << b1 << b2
u2.bookings << b3

