# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
puts "start"

Walker.destroy_all!
Owner.destroy_all!
Appointment.destroy_all!
Dog.destroy_all!

url = 'https://dog.ceo/api/breeds/image/random'
result = open(url).read
parsed = JSON.parse(result)['message']

comment_array = ["Great job with my puppy!", "My dog was so happy to get outside. No problems.", "Seemed to love animals and treated my dog so well",
                    "Took care of my pup while I was away, definitely knew what they were doing!", "Nice job.", "Had some extra treats for my pup, so sweet!",
                    "Was patient with my dog who can be difficult.", "Knew exactly how to treat my dog, will use again!", "Awesome!", "Good job.", "Happy with the service"]

description_array = ["A bit aggressive at times but overall quite nice!", "Such a sweetie!", "Obeys commands easily.", "She can be a bit naughty at times",
                    "Loves to be outside.", "Doesn't really listen well.", "Getting old so go slow", "Puppy full of energy and wants to play!", "Gentle soul", "A bit timid at times"]

20.times do
    user = Walker.new({
        name: Faker::FunnyName.name,
        phone: "1" + rand(10 ** 10).to_s,
        address: "fjkfjkdjfdkghkfghk",
        pic: ["http://lc-dkmjoglx.cn-n1.lcfile.com/6e2021fa0482a3660248/adult-background-casual-941693.jpg",
        "http://lc-dkmjoglx.cn-n1.lcfile.com/e1eafefd8c4a5613d655/collared-shirt-handsome-indoors-936229.jpg",
        "http://lc-dkmjoglx.cn-n1.lcfile.com/6e2021fa0482a3660248/adult-background-casual-941693.jpg",
        "http://lc-dkmjoglx.cn-n1.lcfile.com/db0412837644dd43f597/casual-college-connection-1438081.jpg",
        "http://lc-dkmjoglx.cn-n1.lcfile.com/8811e378406628ea7e60/adult-boy-casual-220453.jpg",
        "http://lc-dkmjoglx.cn-n1.lcfile.com/2bda7ef20a38f9ffa158/black-leather-jacket-blur-bracelet-775358.jpg",
        "http://lc-dkmjoglx.cn-n1.lcfile.com/2f5a7aacd7806a196910/black-and-white-fun-good-looking-91227.jpg",
        "http://lc-dkmjoglx.cn-n1.lcfile.com/0a1bd6eb41aa279ac520/adult-blur-boy-1212984.jpg",
        "http://lc-dkmjoglx.cn-n1.lcfile.com/43e1be65c974e2ecf365/black-and-white-boy-casual-555790.jpg",
        "http://lc-dkmjoglx.cn-n1.lcfile.com/553363eb1328aa17a929/adult-businessman-contemporary-937481.jpg",
        "http://lc-dkmjoglx.cn-n1.lcfile.com/a630f99ee72a2ae06261/adult-blurred-background-checkered-shirt-936072.jpg",
        "https://leancloud.cn/dashboard/data.html?appid=DkmjoGlxMjnfPDQafHuUytF7-gzGzoHsz#/_File",
        "http://lc-dkmjoglx.cn-n1.lcfile.com/9a4de3810d7cea9b95e4/beautiful-brunette-cute-774909.jpg",
        "http://lc-dkmjoglx.cn-n1.lcfile.com/6c05381f587df264ca49/attractive-beautiful-beauty-1820574.jpg",
        "http://lc-dkmjoglx.cn-n1.lcfile.com/63d660ba66ca43a9852c/attractive-beautiful-casual-1082962.jpg",
        "http://lc-dkmjoglx.cn-n1.lcfile.com/e6318fa0eb3d0281980d/adult-beautiful-blond-hair-1130626.jpg",
        "http://lc-dkmjoglx.cn-n1.lcfile.com/f5c838a6e2c23fccf610/beautiful-beauty-brazilian-woman-1102341.jpg",
        "http://lc-dkmjoglx.cn-n1.lcfile.com/c873d3460f7f5e5eda25/adorable-casual-cute-1752134.jpg",
        "http://lc-dkmjoglx.cn-n1.lcfile.com/6cd8fe93b03d1bf56b63/adult-asian-bar-323503.jpg",
        "http://lc-dkmjoglx.cn-n1.lcfile.com/4e9c6dd05c943b85882a/beautiful-beauty-blond-1587009.jpg",
        "http://lc-dkmjoglx.cn-n1.lcfile.com/bf4342d97806d4482039/beautiful-beautiful-woman-beauty-1566554.jpg"].sample,
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