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

Card.create(user_id: '1', region_id: '1', prefecture_id: '1', dam_name: '厚幌ダム', visit_date: '2018-12-31', version_bf: '0', version_af: '1', version_y: '2016', version_m: '6')

Card.create(user_id: '1', region_id: '2', prefecture_id: '2', dam_name: '津軽ダム', visit_date: '2018-12-31', version_bf: '0', version_af: '1', version_y: '2016', version_m: '6')

Prefecture.create(region_id: '1', name: '北海道')

Prefecture.create(region_id: '2', name: '青森県')
Prefecture.create(region_id: '2', name: '秋田県')
Prefecture.create(region_id: '2', name: '岩手県')
Prefecture.create(region_id: '2', name: '福島県')
Prefecture.create(region_id: '2', name: '宮城県')
Prefecture.create(region_id: '2', name: '山形県')

Prefecture.create(region_id: '3', name: '茨城県')
Prefecture.create(region_id: '3', name: '神奈川県')
Prefecture.create(region_id: '3', name: '群馬県')
Prefecture.create(region_id: '3', name: '埼玉県')
Prefecture.create(region_id: '3', name: '千葉県')
Prefecture.create(region_id: '3', name: '東京都')
Prefecture.create(region_id: '3', name: '栃木県')

Prefecture.create(region_id: '4', name: '石川県')
Prefecture.create(region_id: '4', name: '富山県')
Prefecture.create(region_id: '4', name: '長野県')
Prefecture.create(region_id: '4', name: '新潟県')
Prefecture.create(region_id: '4', name: '福井県')
Prefecture.create(region_id: '4', name: '山梨県')

Prefecture.create(region_id: '5', name: '愛知県')
Prefecture.create(region_id: '5', name: '岐阜県')
Prefecture.create(region_id: '5', name: '静岡県')
Prefecture.create(region_id: '5', name: '三重県')

Prefecture.create(region_id: '6', name: '大阪府')
Prefecture.create(region_id: '6', name: '京都府')
Prefecture.create(region_id: '6', name: '滋賀県')
Prefecture.create(region_id: '6', name: '兵庫県')
Prefecture.create(region_id: '6', name: '奈良県')
Prefecture.create(region_id: '6', name: '和歌山県')

Prefecture.create(region_id: '7', name: '岡山県')
Prefecture.create(region_id: '7', name: '島根県')
Prefecture.create(region_id: '7', name: '鳥取県')
Prefecture.create(region_id: '7', name: '広島県')
Prefecture.create(region_id: '7', name: '山口県')

Prefecture.create(region_id: '8', name: '愛媛県')
Prefecture.create(region_id: '8', name: '香川県')
Prefecture.create(region_id: '8', name: '高知県')
Prefecture.create(region_id: '8', name: '徳島県')

Prefecture.create(region_id: '9', name: '大分県')
Prefecture.create(region_id: '9', name: '鹿児島県')
Prefecture.create(region_id: '9', name: '熊本県')
Prefecture.create(region_id: '9', name: '佐賀県')
Prefecture.create(region_id: '9', name: '長崎県')
Prefecture.create(region_id: '9', name: '福岡県')
Prefecture.create(region_id: '9', name: '宮崎県')
Prefecture.create(region_id: '9', name: '沖縄県')

Dam.create(region_id: '1', prefecture_id: '1', name: '厚幌ダム', name_kana: 'あっぽろだむ', river: '厚真川水系厚真川', dam_type: '1', gate: 'コンジットゲート', height: '427', length: '516', volume: '4740', purpose: '3', constructor: '安藤ハザマ・岩田地崎・田中JV', start_of_construction: '2014', end_of_construction: '2019', dam_image_id: '1')



