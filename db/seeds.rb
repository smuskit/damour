# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Region.create(name: '北海道')
Region.create(name: '東北')
Region.create(name: '関東')
Region.create(name: '北陸・甲信越')
Region.create(name: '東海')
Region.create(name: '近畿')
Region.create(name: '中国')
Region.create(name: '四国')
Region.create(name: '九州')

Prefecture.create(region_id: '1', name: '北海道')

Prefecture.create(region_id: '2', name: '青森')
Prefecture.create(region_id: '2', name: '秋田')
Prefecture.create(region_id: '2', name: '岩手')
Prefecture.create(region_id: '2', name: '福島')
Prefecture.create(region_id: '2', name: '宮城')
Prefecture.create(region_id: '2', name: '山形')

Prefecture.create(region_id: '3', name: '茨城')
Prefecture.create(region_id: '3', name: '神奈川')
Prefecture.create(region_id: '3', name: '群馬')
Prefecture.create(region_id: '3', name: '埼玉')
Prefecture.create(region_id: '3', name: '千葉')
Prefecture.create(region_id: '3', name: '東京')
Prefecture.create(region_id: '3', name: '栃木')

Prefecture.create(region_id: '4', name: '石川')
Prefecture.create(region_id: '4', name: '富山')
Prefecture.create(region_id: '4', name: '長野')
Prefecture.create(region_id: '4', name: '新潟')
Prefecture.create(region_id: '4', name: '福井')
Prefecture.create(region_id: '4', name: '山梨')

Prefecture.create(region_id: '5', name: '愛知')
Prefecture.create(region_id: '5', name: '岐阜')
Prefecture.create(region_id: '5', name: '静岡')
Prefecture.create(region_id: '5', name: '三重')

Prefecture.create(region_id: '6', name: '大阪')
Prefecture.create(region_id: '6', name: '京都')
Prefecture.create(region_id: '6', name: '滋賀')
Prefecture.create(region_id: '6', name: '兵庫')
Prefecture.create(region_id: '6', name: '奈良')
Prefecture.create(region_id: '6', name: '和歌山')

Prefecture.create(region_id: '7', name: '岡山')
Prefecture.create(region_id: '7', name: '島根')
Prefecture.create(region_id: '7', name: '鳥取')
Prefecture.create(region_id: '7', name: '広島')
Prefecture.create(region_id: '7', name: '山口')

Prefecture.create(region_id: '8', name: '愛媛')
Prefecture.create(region_id: '8', name: '香川')
Prefecture.create(region_id: '8', name: '高知')
Prefecture.create(region_id: '8', name: '徳島')

Prefecture.create(region_id: '9', name: '大分')
Prefecture.create(region_id: '9', name: '鹿児島')
Prefecture.create(region_id: '9', name: '熊本')
Prefecture.create(region_id: '9', name: '佐賀')
Prefecture.create(region_id: '9', name: '長崎')
Prefecture.create(region_id: '9', name: '福岡')
Prefecture.create(region_id: '9', name: '宮崎')
Prefecture.create(region_id: '9', name: '沖縄')

