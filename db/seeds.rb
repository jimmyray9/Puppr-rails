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
                    
img = ["http://lc-dkmjoglx.cn-n1.lcfile.com/e4ad8c03998aa9e5b243/Screen%20Shot%202019-05-05%20at%206.43.22%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/1b64fdd05bf1fbff51a4/Screen%20Shot%202019-05-05%20at%206.27.53%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/1f2b4c2e65fb070ea791/Screen%20Shot%202019-05-05%20at%206.27.41%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/c8e7201e172bd02ddd2c/Screen%20Shot%202019-05-05%20at%207.09.21%20PM.png",
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
"http://lc-dkmjoglx.cn-n1.lcfile.com/f51dd195cafa961211a8/Screen%20Shot%202019-05-05%20at%206.28.10%20PM.png",
"http://lc-dkmjoglx.cn-n1.lcfile.com/2ce9e41c2174cea45a5e/Screen%20Shot%202019-05-05%20at%206.27.07%20PM.png"]

location = ["四川省成都市青羊长顺上街127号", "成都市武侯区人民南路三段17号", "成都市锦江区迎晖路222号", "成都市锦江区督院街30号", "四川省成都市成华区三环以内二仙桥东三路1号", "四川省成都市青羊区文殊院街66号", "武侯区金花桥街道新苗社区", "成都市成华区崔家店路502号", "四川省成都市金牛区站东路1号", "四川省成都市龙泉驿区成洛大道2025号", "成都市武侯区人民南路三段17号", "四川省成都市锦江区中纱帽街8号", "四川省成都市锦江区春熙路", "四川省成都市青羊区人民中路一段16号省展览馆内(天府广场北侧)", "文庙前街93号", "成都市区青羊区蜀都大道少城路12号", "下东大街199号", "成都市成华区望平街116号", "成都市青羊区金沙遗址路2号", "成都市成华区成都外北熊猫大道1375号","四川省成都市青羊长顺上街127号", "成都市武侯区人民南路三段17号", "成都市锦江区迎晖路222号", "成都市锦江区督院街30号", "四川省成都市成华区三环以内二仙桥东三路1号", "四川省成都市青羊区文殊院街66号", "武侯区金花桥街道新苗社区", "成都市成华区崔家店路502号", "四川省成都市金牛区站东路1号", "四川省成都市龙泉驿区成洛大道2025号", "成都市武侯区人民南路三段17号", "四川省成都市锦江区中纱帽街8号", "四川省成都市锦江区春熙路", "四川省成都市青羊区人民中路一段16号省展览馆内(天府广场北侧)", "文庙前街93号", "成都市区青羊区蜀都大道少城路12号", "下东大街199号", "成都市成华区望平街116号", "成都市青羊区金沙遗址路2号", "成都市成华区成都外北熊猫大道1375号", "四川省成都市青羊长顺上街127号", "成都市武侯区人民南路三段17号", "成都市锦江区迎晖路222号", "成都市锦江区督院街30号", "四川省成都市成华区三环以内二仙桥东三路1号", "四川省成都市青羊区文殊院街66号", "武侯区金花桥街道新苗社区", "成都市成华区崔家店路502号", "四川省成都市金牛区站东路1号", "四川省成都市龙泉驿区成洛大道2025号", "成都市武侯区人民南路三段17号", "四川省成都市锦江区中纱帽街8号", "四川省成都市锦江区春熙路", "四川省成都市青羊区人民中路一段16号省展览馆内(天府广场北侧)", "文庙前街93号", "成都市区青羊区蜀都大道少城路12号", "下东大街199号", "成都市成华区望平街116号", "成都市青羊区金沙遗址路2号", "成都市成华区成都外北熊猫大道1375号"]

links = ['http://lc-2gbag7yx.cn-n1.lcfile.com/25f00d61bc042b4f3729/pups_19.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/30f77d83261472921f7a/pups_20.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/9dd66692d648ecb1ddba/pups_21.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/d0659b800e51fce76996/pups_15.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/decb4682141341a319bb/pups_17.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/940be4b70dfbef0a7b36/pups_18.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/3b2d8755fcfd57365145/pups_11.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/bf8c027558aa69cd102e/pups_14.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/c920709d4b1713bf3454/pups_12.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/be28d3115e52bb7f6440/pups_7.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/7f8cda76ed11c291b1fa/pups_8.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/99eb0c51ab21814fb539/pups_9.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/1149f9fe9829cbbfb7ae/pups_6.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/e673d4df16540528ea52/pups_4.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/28209ceba668b9cc2895/pups_5.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/f22c5d75e3806d9ed7d4/pups_3.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/4852f23628586f1ab88b/pups_0.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/373798dff0f1618da0fd/pups_2.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/0fc9e92d4df633819abe/pups_10.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/68fd8d1a8b51dfbbaa88/pups_16.jpg', 'http://lc-2gbag7yx.cn-n1.lcfile.com/40d96e820b0f01bb449e/pups_13.jpg']

dog_names = ['Max', "BaoBao", "Spike", 'Ya Er', "Asa", "Xue Xue", "Dian dian", "Sparkles", "Dr. Paws", "Thor", "Gui gui", "Bandit", "Daisy", "Buddy", "Charlie", "Bear","Brownie", "Xiao Bai", "Xiao Wang", "Griffin"]

walker_name = ["张吉惟","林国瑞","林玟书","林雅南","江奕云","刘柏宏","阮建安","林子帆","夏志豪","吉茹定","李中冰","黄文隆","谢彦文","傅智翔","洪振霞","刘姿婷","荣姿康","方一强","黎芸贵"]
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