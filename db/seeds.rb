# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tag.create([
  { name: '陸トレ' },
  { name: 'スケボー' },
  { name: 'ショートボード' },
  { name: 'ロングボード' },
  { name: 'ボディボード' },
  { name: 'キッズ' },
  { name: 'ボーイズ' },
  { name: 'ジュニア' },
  { name: 'メン' },
  { name: 'シニア' },
  { name: 'マスター' },
  { name: 'グランドマスター' },
  { name: 'カフナ' },
  { name: 'ガールズ' },
  { name: 'ウィメン' },
  { name: 'シニアウィメン' }
  ])

Admin.create(
   email: 'admin@test.com',
   password: 'adminadmin',
)

Area.create([
  { name: '北海道' },
  { name: '東北（太平洋）' },
  { name: '東北（日本海）' },
  { name: '北陸' },
  { name: '茨城' },
  { name: '千葉北' },
  { name: '千葉南' },
  { name: '湘南' },
  { name: '西湘' },
  { name: '伊豆' },
  { name: '静岡' },
  { name: '伊良湖' },
  { name: '伊勢志摩' },
  { name: '和歌山' },
  { name: '近畿・中国（日本海）' },
  { name: '四国' },
  { name: '宮崎' },
  { name: '九州' },
  { name: '沖縄' },
  { name: '離島' },
  { name: '海外' },
  { name: '秘密' }
  ])
