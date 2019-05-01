# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

url = 'https://dog.ceo/api/breeds/image/random'
result = open(url).read
parsed = JSON.parse(result)['message']

_comment_array = ["Great job with my puppy!", "My dog was so happy to get outside. No problems.", "Seemed to love animals and treated my dog so well",
                    "Took care of my pup while I was away, definitely knew what they were doing!", "Nice job.", "Had some extra treats for my pup, so sweet!",
                    "Was patient with my dog who can be difficult.", "Knew exactly how to treat my dog, will use again!", "Awesome!", "Good job.", "Happy with the service"]

description_array = ["A bit aggressive at times but overall quite nice!", "Such a sweetie!", "Obeys commands easily.", "She can be a bit naughty at times",
                    "Loves to be outside.", "Doesn't really listen well.", "Getting old so go slow", "Puppy full of energy and wants to play!", "Gentle soul", "A bit timid at times"]

20.times do
    user = Walker.new({
        name: Faker::FunnyName.name,
        phone: "1" + rand(10 ** 10).to_s,
        zip_code: ['610000', '610012', '610013', '610014', '610015', '610016','610043', '610036', '610041', ].sample,
        pic: 'https://randomuser.me/api/portraits/' + ['women/','men/'].sample + rand(99).to_s + '.jpg',
        avg_rating: ((3..4).to_a.sample.to_s + "." + (0..9).to_a.sample.to_s).to_f
    })
    user.save
end

20.times do
    user = Owner.create({
        name: Faker::FunnyName.name,
        zip_code: ['610000', '610012', '610013', '610014', '610015', '610016','610043', '610036', '610041', ].sample,

    })
    user.save
    4.times do 
        appointment = Appointment.create({
            walker_id: (1..20).to_a.sample,
            duration: [15, 20, 25, 30, 45, 60, 90].sample ,
            note: ["Don't walk if its raining", "Bring some treats please!", "", "Doesn't play well with others", "The lease is next to the door."].sample,
            start_time: (07..18).to_a.sample.to_s + ":" + ["00","15","30", "60"],
            date: Date.today() + rand(7),
            location: Faker::Address.street_address ,
            is_scheduled: [true, false].sample,
            comment: comment_array.sample,
            rating: (3..5).to_a.sample 
        })
        appointment.save
    end
    (1..2).to_a.sample.times do
        dog = Dog.create({
            name: Faker::Creature::Dog.name,
            breed: Faker::Creature::Dog.breed,
            age: 1 + rand(17) ,
            description: description_array.sample,
            size: ['SMALL', 'MEDIUM', 'LARGE'].sample,
            gender: ['M', 'F'].sample,
            pic: parsed, 
            owner_id: user.id,
            appointment_id: appointment.id
        })
        dog.save
    end
   
end

10.times do 
    appointment = Appointment.create({
        walker_id: (1..20).to_a.sample,
        duration: [15, 20, 25, 30, 45, 60, 90].sample ,
        note: ["Don't walk if its raining", "Bring some treats please!", "", "Doesn't play well with others", "The lease is next to the door."].sample,
        start_time: (07..18).to_a.sample.to_s + ":" + ["00","15","30", "60"],
        date: Date.today() - rand(15),
        location: Faker::Address.street_address ,
        is_scheduled: [true, false].sample,
        comment: comment_array.sample,
        rating: (3..5).to_a.sample 
    })
    appointment.save
end