# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: 'our@cats', password: 'ourcats')

10.times do |num|
 sex = num.even? ? "female" : "male"
 member = Member.create!(
  name: "会員#{num + 1}",
  sex: sex,
  prefectures: "東京都",
  email: "email#{num + 1}@email",
  password: "password#{num + 1}",
  password_confirmation: "password#{num + 1}",
  phone_number: "00000000000#{num + 1}",
  address: "東京都#{num + 1}",
  real_name: "令和優#{num + 1}"
 )
 member.image.attach(io: File.open(Rails.root.join("app/assets/images/身分証.jpg")), filename: "身分証.jpg")
end

  category_names = [
 '雑種（ミックス）',
 '和猫',
 'ジャパニーズ・ボブテイル',
 'スコティッシュフォールド',
 'マンチカン',
 'アメリカンショートヘア',
 'ラグドール',
 'ブリティッシュショートヘア',
 'ノルウェージャンフォレストキャット',
 'サイベリアン',
 'ロシアンブルー',
 'ベンガル',
 'アメリカンカール',
 'メインクーン',
 'ペルシャ',
 'ラガマフィン',
 'エキゾチック',
 'シャム猫(サイアミーズ）',
 'ソマリ',
 'アビシニアン',
 'シンガプーラ',
 'トンキニーズ',
 'シャルトリュー',
 'ヒマラヤン',
 'セルカークレックス',
 'ボンベイ',
 'マンチカール',
 'エジプシャンマウ',
 'オシキャット',
 'ラパーマ',
 'バーマン',
 'その他'
]
category_names.each do |category_name|
 Category.create!(name: category_name)
end

cat = Cat.create!(
  member_id: 1,
  category_id: 2,
  name: "ことら",
  sex: "male",
  age: 6,
  introduction: "布団に潜るのが好き"
)
cat.image.attach(io: File.open(Rails.root.join("app/assets/images/ことら小.jpg")), filename: "ことら小.jpg")

cat = Cat.create!(
  member_id: 1,
  category_id: 2,
  name: "ギャオ",
  sex: "female",
  age: 6,
  introduction: "日向ぼっこが好き"
  )
cat.image.attach(io: File.open(Rails.root.join("app/assets/images/newギャオ小.jpg")), filename: "newギャオ小.jpg")

cat = Cat.create!(
  member_id: 2,
  category_id: 13,
  name: "アル",
  sex: "male",
  age: 1,
  introduction: ""
  )
cat.image.attach(io: File.open(Rails.root.join("app/assets/images/アメカ4.jpg")), filename: "アメカ4.jpg")

cat = Cat.create!(
  member_id: 3,
  category_id: 6,
  name: "ララ",
  sex: "female",
  age: 4,
  introduction: ""
  )
cat.image.attach(io: File.open(Rails.root.join("app/assets/images/アメショ4.jpg")), filename: "アメショ4.jpg")

cat = Cat.create!(
  member_id: 4,
  category_id: 31,
  name: "みかん",
  sex: "female",
  age: 3,
  introduction: ""
  )
cat.image.attach(io: File.open(Rails.root.join("app/assets/images/バーマン4.jpg")), filename: "バーマン4.jpg")

cat = Cat.create!(
  member_id: 5,
  category_id: 14,
  name: "もふもふ",
  sex: "female",
  age: 5,
  introduction: ""
  )
cat.image.attach(io: File.open(Rails.root.join("app/assets/images/メインクーン4.jpg")), filename: "メインクーン4.jpg")

cat = Cat.create!(
  member_id: 6,
  category_id: 14,
  name: "ぶる",
  sex: "male",
  age: 5,
  introduction: ""
  )
cat.image.attach(io: File.open(Rails.root.join("app/assets/images/ロシアンブルー4.jpg")), filename: "ロシアンブルー4.jpg")
