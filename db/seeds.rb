
# Seed実行時にTruncateするテーブルはコメント外す
tables_to_initialize = [
  # :users, 
  # :posts,
  # :likes,                             # 店舗ユーザ
  # :issued_coupons # 発行クーポン
]
# 再投入対象のテーブルを初期化
  tables_to_initialize.each do |table|
    ActiveRecord::Base.connection.execute("DELETE FROM #{table}") if table != "schema_migrations"
    ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence where name='#{table}'") if table != "schema_migrations"
  end                                                                                                                               
 ActiveRecord::Base.connection.execute("VACUUM")

# Faker::Config.locale = :ja

# user
# User.create!(
#   id: 111,
#   name: 'Shingo',
#   email: 'shingo@sample.com',
#   password: 'shingo',
#   gender: 1,
#   icon_image_name: '3.jpg', 
#   birthday: '1990-12-28',
#   user_height: 173,
#   description: '筋トレにハマってます！みなさん一緒に頑張りましょう！'
# )
# User.create!(
#   id: 112,
#   name: 'ぴよ',
#   email: 'piyo@sample.com',
#   password: 'piyo',
#   gender: 2,
#   icon_image_name: 'default_user_image.jpg', 
#   birthday: '1995-07-21',
#   user_height: 157,
#   description: '初心者ですが頑張ります！'
# )
# User.create!(
#   id: 113,
#   name: 'くろもふ',
#   email: 'kuromofu@sample.com',
#   password: 'kuromofu',
#   gender: 1,
#   icon_image_name: 'default_user_image.jpg', 
#   birthday: '1980-11-28',
#   user_height: 180,
#   description: 'よろしくお願いします'
# )


# posts

9.times do |times|
  times += 1
Post.create!(
  body_weight: 60 - 2 * times,
  training_menu: "",
  meal_menu: "",
  body_fat_percentage: 20,
  total_calorie: 2000,
  recording_date: "2021-03-#{times}",
  user_id: 112,
)
Post.create!(
  body_weight: 60 - times,
  training_menu: "",
  meal_menu: "",
  body_fat_percentage: 20 - times,
  total_calorie: 2000,
  recording_date: "2021-03-1#{times}",
  user_id: 111,
)
end

# StoreUser.create!(
#   email: 'sample1@gmail.com'
# )
# StoreUser.create!(
#   id: 2,
#   email: 'sample2@gmail.com',
#   encrypted_password: 'password',
#   name: 'user2'
# )
# StoreUser.create!(
#   id: 3,
#   email: 'sample3@gmail.com',
#   encrypted_password: 'password',
#   name: 'user3'
# )

# # クーポンデータ
# 3.times do |times|
#   times += 1

#   Coupon.create!(
#     id: times,
#     store_id: 1,
#     title: "クーポン #{times}",
#     description: " #{times}枚目のクーポンです",
#     image_url: "image#{times}",
#   )
# end

# # 発行クーポン
# 3.times do |times|
#   times += 1

#   enable_at = Time.now
#   expired_at = enable_at.plus_with_duration 30.days

#   IssuedCoupon.create!(
#     coupon_id: times,
#     expired_at: expired_at,
#     used_at: Faker::Boolean.boolean,
#     use_status: Faker::Number.within(range: 0..2)

#   )
# end