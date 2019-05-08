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

# url = 'https://dog.ceo/api/breeds/image/random'
# result = open(url).read
# parsed = JSON.parse(result)['message']

comment_array = ["Great job with my puppy!", "My dog was so happy to get outside. No problems.", "Seemed to love animals and treated my dog so well","Took care of my pup while I was away, definitely knew what they were doing!", "Nice job.", "Had some extra treats for my pup, so sweet!","Was patient with my dog who can be difficult.", "Knew exactly how to treat my dog, will use again!", "Awesome!", "Good job.", "Happy with the service"]

description_array = ["A bit aggressive at times but overall quite nice!", "Such a sweetie!", "Obeys commands easily.", "She can be a bit naughty at times","Loves to be outside.", "Doesn't really listen well.", "Getting old so go slow", "Puppy full of energy and wants to play!", "Gentle soul", "A bit timid at times"]

img = ["http://lc-dkmjoglx.cn-n1.lcfile.com/afd605dc26d8e52d4530/Screen%20Shot%202019-05-07%20at%208.02.01%20PM.png", 
"http://lc-dkmjoglx.cn-n1.lcfile.com/697f1c145f7aad5c38b7/Screen%20Shot%202019-05-07%20at%207.52.07%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/4d77e64234dd9f3dfcc0/Screen%20Shot%202019-05-07%20at%207.51.58%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/4b133c8029025223a8d1/Screen%20Shot%202019-05-07%20at%207.51.38%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/0cb1f50d9e2a7ec6a735/Screen%20Shot%202019-05-07%20at%207.51.08%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/1994d39c351b843c6dc7/Screen%20Shot%202019-05-07%20at%207.51.30%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/5e8ed5d4ed87aa7cbf86/Screen%20Shot%202019-05-07%20at%207.51.19%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/818b083fe5b609eefdb6/Screen%20Shot%202019-05-07%20at%207.50.46%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/715e7576abb37c6d1b2b/Screen%20Shot%202019-05-07%20at%207.50.31%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/e45ff77f9543fbc19b4c/Screen%20Shot%202019-05-07%20at%207.52.17%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/6036ae079f650f6b3458/Screen%20Shot%202019-05-07%20at%207.53.34%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/6045be43ea4a06fdef29/Screen%20Shot%202019-05-07%20at%207.53.43%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/5c2dcd4ba32a2617f660/Screen%20Shot%202019-05-07%20at%207.53.27%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/f43aa17445d1f3f4b932/Screen%20Shot%202019-05-07%20at%207.52.50%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/3062542c30820e0e42dd/Screen%20Shot%202019-05-07%20at%207.53.01%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/7bb50d65fa6b14ff1da2/Screen%20Shot%202019-05-07%20at%207.53.17%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/491bfd260db2cdef836b/Screen%20Shot%202019-05-07%20at%207.52.24%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/2c5da14c620f553de326/Screen%20Shot%202019-05-07%20at%207.50.58%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/b6f42bed33182bd79716/Screen%20Shot%202019-05-07%20at%208.02.19%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/afc3f8efc9594b1fdb1d/Screen%20Shot%202019-05-07%20at%208.02.29%20PM.png"]

location = ["四川省成都市青羊长顺上街127号", "成都市武侯区人民南路三段17号", "成都市锦江区迎晖路222号", "成都市锦江区督院街30号", "四川省成都市成华区三环以内二仙桥东三路1号", "四川省成都市青羊区文殊院街66号", "武侯区金花桥街道新苗社区", "成都市成华区崔家店路502号", "四川省成都市金牛区站东路1号", "四川省成都市龙泉驿区成洛大道2025号", "成都市武侯区人民南路三段17号", "四川省成都市锦江区中纱帽街8号", "四川省成都市锦江区春熙路", "四川省成都市青羊区人民中路一段16号省展览馆内(天府广场北侧)", "文庙前街93号", "成都市区青羊区蜀都大道少城路12号", "下东大街199号", "成都市成华区望平街116号", "成都市青羊区金沙遗址路2号", "成都市成华区成都外北熊猫大道1375号","四川省成都市青羊长顺上街127号", "成都市武侯区人民南路三段17号", "成都市锦江区迎晖路222号", "成都市锦江区督院街30号", "四川省成都市成华区三环以内二仙桥东三路1号", "四川省成都市青羊区文殊院街66号", "武侯区金花桥街道新苗社区", "成都市成华区崔家店路502号", "四川省成都市金牛区站东路1号", "四川省成都市龙泉驿区成洛大道2025号", "成都市武侯区人民南路三段17号", "四川省成都市锦江区中纱帽街8号", "四川省成都市锦江区春熙路", "四川省成都市青羊区人民中路一段16号省展览馆内(天府广场北侧)", "文庙前街93号", "成都市区青羊区蜀都大道少城路12号", "下东大街199号", "成都市成华区望平街116号", "成都市青羊区金沙遗址路2号", "成都市成华区成都外北熊猫大道1375号", "四川省成都市青羊长顺上街127号", "成都市武侯区人民南路三段17号", "成都市锦江区迎晖路222号", "成都市锦江区督院街30号", "四川省成都市成华区三环以内二仙桥东三路1号", "四川省成都市青羊区文殊院街66号", "武侯区金花桥街道新苗社区", "成都市成华区崔家店路502号", "四川省成都市金牛区站东路1号", "四川省成都市龙泉驿区成洛大道2025号", "成都市武侯区人民南路三段17号", "四川省成都市锦江区中纱帽街8号", "四川省成都市锦江区春熙路", "四川省成都市青羊区人民中路一段16号省展览馆内(天府广场北侧)", "文庙前街93号", "成都市区青羊区蜀都大道少城路12号", "下东大街199号", "成都市成华区望平街116号", "成都市青羊区金沙遗址路2号", "成都市成华区成都外北熊猫大道1375号"]

links = ['http://lc-2gbag7yx.cn-n1.lcfile.com/25f00d61bc042b4f3729/pups_19.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/30f77d83261472921f7a/pups_20.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/9dd66692d648ecb1ddba/pups_21.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/d0659b800e51fce76996/pups_15.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/decb4682141341a319bb/pups_17.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/940be4b70dfbef0a7b36/pups_18.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/3b2d8755fcfd57365145/pups_11.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/bf8c027558aa69cd102e/pups_14.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/c920709d4b1713bf3454/pups_12.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/be28d3115e52bb7f6440/pups_7.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/7f8cda76ed11c291b1fa/pups_8.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/99eb0c51ab21814fb539/pups_9.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/1149f9fe9829cbbfb7ae/pups_6.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/e673d4df16540528ea52/pups_4.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/28209ceba668b9cc2895/pups_5.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/f22c5d75e3806d9ed7d4/pups_3.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/4852f23628586f1ab88b/pups_0.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/373798dff0f1618da0fd/pups_2.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/0fc9e92d4df633819abe/pups_10.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/68fd8d1a8b51dfbbaa88/pups_16.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/40d96e820b0f01bb449e/pups_13.jpg']

dog_names = ['Max', "BaoBao", "Spike", 'Ya Er', "Asa", "Xue Xue", "Dian dian", "Sparkles", "Dr. Paws", "Thor", "Gui gui", "Bandit", "Daisy", "Buddy", "Charlie", "Bear","Brownie", "Xiao Bai", "Xiao Wang", "Griffin"]

walker_name = ["张吉惟","林国瑞","林玟书","林雅南","江奕云","刘柏宏","阮建安","林子帆","夏志豪","吉茹定","李中冰","黄文隆","谢彦文","傅智翔","洪振霞","刘姿婷","荣姿康","方一强","黎芸贵","曹徐坤"]
20.times do
    walker = Walker.new({
        name: walker_name.shift,
        phone: "1" + rand(10 ** 10).to_s,
        address: location.shift,
        pic: img.shift,
        avg_rating: ((3..4).to_a.sample.to_s + "." + (0..9).to_a.sample.to_s).to_f
    })
    walker.save
end

first = Walker.first.id
last = first + 19

10.times do 
    appointment = Appointment.create({
        walker_id: (first..last).to_a.sample,
        duration: [15, 20, 25, 30, 45, 60, 90].sample ,
        note: ["Don't walk if its raining", "Bring some treats please!", "", "Doesn't play well with others", "The lease is next to the door."].sample,
        start_time: (07..18).to_a.sample.to_s + ":" + ["00","15","30", "60"].sample.to_s,
        date: Date.today() - rand(15),
        location: location.sample,
        is_scheduled: [true, false].sample,
        is_completed: true,
        comment: comment_array.sample,
        rating: (3..5).to_a.sample 
    })
    appointment.save
end

20.times do
    owner = Owner.create({
        name: Faker::FunnyName.name,
        address: location.shift
    })

    a = Owner.first.id
    b = a + 19

    owner.save
    4.times do 
        appointment = Appointment.create({
            walker_id: (first..last).to_a.sample,
            duration: [15, 20, 25, 30, 45, 60, 90].sample ,
            note: ["Don't walk if its raining", "Bring some treats please!", "", "Doesn't play well with others", "The lease is next to the door."].sample,
            start_time: (07..18).to_a.sample.to_s + ":" + ["00","15","30", "60"].sample.to_s,
            date: Date.today() + rand(7),
            location: Faker::Address.street_address,
            is_scheduled: [true, false].sample,
            is_completed: false,
            rating: (3..5).to_a.sample 
        })
        appointment.save
    end
    dog = Dog.create({
        name: dog_names.shift,
        breed: Faker::Creature::Dog.breed,
        age: 1 + rand(17) ,
        description: description_array.sample,
        size: ['SMALL', 'MEDIUM', 'LARGE'].sample,
        gender: ['M', 'F'].sample,
        pic: links.shift, 
        owner_id: (a..b).to_a.sample
    })
    dog.save
   
end

puts "end"