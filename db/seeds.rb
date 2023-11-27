# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: ENV['ADMIN_EMAIL'], password: ENV['ADMIN_PASS'] )

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
  age: "6歳",
  introduction: "布団に潜るのが好き"
)
cat.image.attach(io: File.open(Rails.root.join("app/assets/images/ことら小.jpg")), filename: "ことら小.jpg")

cat = Cat.create!(
  member_id: 1,
  category_id: 2,
  name: "ギャオ",
  sex: "female",
  age: "12歳",
  introduction: "日向ぼっこが好き"
  )
cat.image.attach(io: File.open(Rails.root.join("app/assets/images/newギャオ小.jpg")), filename: "newギャオ小.jpg")

cat = Cat.create!(
  member_id: 2,
  category_id: 13,
  name: "アル",
  sex: "male",
  age: "10ヶ月",
  introduction: ""
  )
cat.image.attach(io: File.open(Rails.root.join("app/assets/images/アメカ4.jpg")), filename: "アメカ4.jpg")

cat = Cat.create!(
  member_id: 3,
  category_id: 6,
  name: "さば",
  sex: "female",
  age: "4歳",
  introduction: ""
  )
cat.image.attach(io: File.open(Rails.root.join("app/assets/images/アメショ4.jpg")), filename: "アメショ4.jpg")

cat = Cat.create!(
  member_id: 4,
  category_id: 18,
  name: "ジャム",
  sex: "male",
  age: "3歳",
  introduction: "人懐っこい"
  )
cat.image.attach(io: File.open(Rails.root.join("app/assets/images/バーマン4.jpg")), filename: "バーマン4.jpg")

cat = Cat.create!(
  member_id: 5,
  category_id: 14,
  name: "もふもふ",
  sex: "female",
  age: "5歳",
  introduction: ""
  )
cat.image.attach(io: File.open(Rails.root.join("app/assets/images/メインクーン4.jpg")), filename: "メインクーン4.jpg")

cat = Cat.create!(
  member_id: 6,
  category_id: 11,
  name: "ぶる",
  sex: "male",
  age: "5ヶ月",
  introduction: "絨毯が好き"
  )
cat.image.attach(io: File.open(Rails.root.join("app/assets/images/ロシアンブルー4.jpg")), filename: "ロシアンブルー4.jpg")

cat = Cat.create!(
  member_id: 6,
  category_id: 9,
  name: "虎太郎",
  sex: "male",
  age: "2歳",
  introduction: "よくうたた寝をする"
  )
cat.image.attach(io: File.open(Rails.root.join("app/assets/images/やや長毛茶トラ.webp")), filename: "やや長毛茶トラ.webp")


member = Member.find(1)
cats = member.cats.map(&:itself)
# member.catsを144行目のようにmapで改めて配列を返す
request = Request.create!(
  member: member,
  season: "11月上旬",
  days: "5",
  location: "home",
  memo: "",
  cats: cats,
  is_complete: true
  # cats: cats [cat1, cat2]
)

member = Member.find(2)
cats = member.cats.map(&:itself)
request = Request.create!(
  member: member,
  season: "11月下旬",
  days: "6",
  location: "home",
  memo: "",
  cats: cats,
  is_complete: true
)

member = Member.find(3)
cats = member.cats.map(&:itself)
request = Request.create!(
  member: member,
  season: "2月中旬～2月下旬",
  days: "10",
  location: "hom",
  memo: "朝晩薬をあげてください。",
  cats: cats,
  is_complete: false
)

member = Member.find(4)
cats = member.cats.map(&:itself)
request = Request.create!(
  member: member,
  season: "2月中旬～下旬",
  days: "15",
  location: "hom",
  memo: "",
  cats: cats,
  is_complete: false
)

member = Member.find(5)
cats = member.cats.map(&:itself)
request = Request.create!(
  member: member,
  season: "3月中旬",
  days: "8",
  location: "home",
  memo: "",
  cats: cats,
  is_complete: false
)
