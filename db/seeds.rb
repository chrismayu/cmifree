# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
Faq.create!( :admin => false, :member_only => false, :title =>'What is the music like? ', :the_answer => 'Praise and worship is an important part of our services. You can expect a mix of contemporary Christian music along with the occasional classic hymn. Don’t worry if you don’t know the lyrics, we will project the words on the main screen to help you out. The congregation tends to sing along with the worship team, and do not be surprised if some people become expressive in their praise by clapping or raising their hands.')
Faq.create!( :admin => false, :member_only => false, :title =>'What should I wear? ', :the_answer => 'We do not have a dress code, so please feel free to come dressed in what you feel is most comfortable. If you are concerned with the ‘fashion trends’ at our services you will likely see some suits and ties on Sundays while more casual dress on Wednesdays.')
 