# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
    user = Walker.new({
        name: Faker::FunnyName.name,
        phone_number: Faker::PhoneNumber.phone_number,
        is_walker: true,
        walker_age: rand(19..35),
        walker_description: Faker::Movie.quote,
        zip_code: [610000, 610012, 610013, 610043, 610036].sample,
        walker_img: Faker::Internet.url
    })
    user.save
end

50.times do
    user = Owner.create({
        name: Faker::FunnyName.name,
        phone_number: Faker::PhoneNumber.phone_number,
        zip_code: [610000, 610012, 610013, 610043, 610036].sample
    })
    user.save
    dog = Dog.create({
        name: ,
        breed: ,
        age: 1 + rand(17) ,
        description: ,
        size: ['XS','S', 'M', 'L','XL'].sample,
        gender: ['M', 'F'].sample,
        pic: ''
    })
end