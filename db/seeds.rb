# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
puts "start"

Walker.destroy_all
Owner.destroy_all
Appointment.destroy_all
Dog.destroy_all

url = 'https://dog.ceo/api/breeds/image/random'
result = open(url).read
parsed = JSON.parse(result)['message']

comment_array = ["Great job with my puppy!", "My dog was so happy to get outside. No problems.", "Seemed to love animals and treated my dog so well",
                    "Took care of my pup while I was away, definitely knew what they were doing!", "Nice job.", "Had some extra treats for my pup, so sweet!",
                    "Was patient with my dog who can be difficult.", "Knew exactly how to treat my dog, will use again!", "Awesome!", "Good job.", "Happy with the service"]

description_array = ["A bit aggressive at times but overall quite nice!", "Such a sweetie!", "Obeys commands easily.", "She can be a bit naughty at times",
                    "Loves to be outside.", "Doesn't really listen well.", "Getting old so go slow", "Puppy full of energy and wants to play!", "Gentle soul", "A bit timid at times"]

img = ["http://lc-dkmjoglx.cn-n1.lcfile.com/2ce9e41c2174cea45a5e/Screen%20Shot%202019-05-05%20at%206.27.07%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/1b64fdd05bf1fbff51a4/Screen%20Shot%202019-05-05%20at%206.27.53%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/1f2b4c2e65fb070ea791/Screen%20Shot%202019-05-05%20at%206.27.41%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/f51dd195cafa961211a8/Screen%20Shot%202019-05-05%20at%206.28.10%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/d4130a59292a6ae1a208/Screen%20Shot%202019-05-05%20at%206.30.04%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/d3b1aa0ce24b324d4683/Screen%20Shot%202019-05-05%20at%206.29.47%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/487fea340a5bc83d156e/Screen%20Shot%202019-05-05%20at%206.29.35%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/9e0023a8ac2bc1eae48e/Screen%20Shot%202019-05-05%20at%206.29.11%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/6f8f7e270fece71bd7ce/Screen%20Shot%202019-05-05%20at%206.28.51%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/7a94eb80f528f1ca805c/Screen%20Shot%202019-05-05%20at%206.28.21%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/9327c2aa96e7eaebbcdf/Screen%20Shot%202019-05-05%20at%206.28.34%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/f1e82a60631249b6c233/Screen%20Shot%202019-05-05%20at%206.31.24%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/48ded9de17d0644a5527/Screen%20Shot%202019-05-05%20at%206.31.01%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/25d807aad3c3f07b924e/Screen%20Shot%202019-05-05%20at%206.31.14%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/8c3c254278f0e31abe29/Screen%20Shot%202019-05-05%20at%206.30.38%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/25dfc480c1993e53dc35/Screen%20Shot%202019-05-05%20at%206.30.16%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/032c6be2fe015227661c/Screen%20Shot%202019-05-05%20at%206.30.27%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/bf81fa598d3a3d478f23/Screen%20Shot%202019-05-05%20at%206.29.21%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/0be974fd3bd0f49f88c5/casual-college-connection-1438081.jpg",
"http://lc-dkmjoglx.cn-n1.lcfile.com/e4ad8c03998aa9e5b243/Screen%20Shot%202019-05-05%20at%206.43.22%20PM.png"]

20.times do
    user = Walker.new({
        name: Faker::FunnyName.name,
        phone: "1" + rand(10 ** 10).to_s,
        address: "fjkfjkdjfdkghkfghk",
        pic: img.shift,
        avg_rating: ((3..4).to_a.sample.to_s + "." + (0..9).to_a.sample.to_s).to_f
    })
    user.save
end

20.times do
    user = Owner.create({
        name: Faker::FunnyName.name,
        address: "sdasdadasdsaa",
    })
    user.save
    4.times do 
        appointment = Appointment.create({
            walker_id: (1..20).to_a.sample,
            duration: [15, 20, 25, 30, 45, 60, 90].sample ,
            note: ["Don't walk if its raining", "Bring some treats please!", "", "Doesn't play well with others", "The lease is next to the door."].sample,
            start_time: (07..18).to_a.sample.to_s + ":" + ["00","15","30", "60"].sample.to_s,
            date: Date.today() + rand(7),
            location: Faker::Address.street_address ,
            is_scheduled: [true, false].sample,
            rating: (3..5).to_a.sample 
        })
        appointment.save
    end
        dog = Dog.create({
            name: Faker::Creature::Dog.name,
            breed: Faker::Creature::Dog.breed,
            age: 1 + rand(17) ,
            description: description_array.sample,
            size: ['SMALL', 'MEDIUM', 'LARGE'].sample,
            gender: ['M', 'F'].sample,
            pic: parsed, 
            owner_id: (1..20).to_a.sample,
        })
        dog.save
   
end

10.times do 
    appointment = Appointment.create({
        walker_id: (1..20).to_a.sample,
        duration: [15, 20, 25, 30, 45, 60, 90].sample ,
        note: ["Don't walk if its raining", "Bring some treats please!", "", "Doesn't play well with others", "The lease is next to the door."].sample,
        start_time: (07..18).to_a.sample.to_s + ":" + ["00","15","30", "60"].sample.to_s,
        date: Date.today() - rand(15),
        location: Faker::Address.street_address ,
        is_scheduled: [true, false].sample,
        comment: comment_array.sample,
        rating: (3..5).to_a.sample 
    })
    appointment.save
end
puts "end"