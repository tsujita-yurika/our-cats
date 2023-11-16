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
 'ジャパニーズ・ボブテイル',
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
  sex: "男の子",
  age: 6,
  introduction: "布団に潜るのが好き"
)
cat.image.attach(io: File.open(Rails.root.join("app/assets/images/cat.jpg")), filename: "cat.jpg")

cat = Cat.create!(
  member_id: 2,
  category_id: 2,
  name: "ギャオ",
  sex: "女の子",
  age: 6,
  introduction: "日向ぼっこが好き"
  )
cat.image.attach(io: File.open(Rails.root.join("app/assets/images/cat.jpg")), filename: "cat.jpg")

