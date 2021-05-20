
# Seed実行時にTruncateするテーブルはコメント外す
tables_to_initialize = [
  :users, 
  :posts,
  :likes, 
]

# 再投入対象のテーブルを初期化
tables_to_initialize.each do |table|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
  puts "truncated #{table}"
end

#   tables_to_initialize.each do |table|
#     ActiveRecord::Base.connection.execute("DELETE FROM #{table}") if table != "schema_migrations"
#     ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence where name='#{table}'") if table != "schema_migrations"
#   end                                                                                                                               
#  ActiveRecord::Base.connection.execute("VACUUM")

 Faker::Config.locale = :ja
 
 # user
 10.times do |times|
   times += 1
    User.create!(
      id: times,
      name: "#{Faker:Pokemon.name}",
      email: "#{Faker:Pokemon.name}@sample.com",
      password: 'password',
      gender: rand(1..2),
      icon_image_name: 'default_user_image.jpg', 
      birthday: "#{rand(1980..2003)}-#{rand(10..12)}-#{10..28}",
      user_height: rand(153..175),
      description: "筋トレにハマってます！みなさん一緒に頑張りましょう！ちなみに好きなポケモンは#{Faker:Pokemon.name}です"
    )
  end

  User.create!(
    id: 100,
    name: "しろもふ",
    email: "siromofu@sample.com",
    password: 'password',
    gender: 1,
    icon_image_name: '3.jpg', 
    birthday: "1990-12-28",
    user_height: 173,
    description: "筋トレにハマってます！みなさん一緒に頑張りましょう！転職活動中です！"
  )


# posts
10.times do |times|
  times += 1
  10.times do 
    Post.create!(
      body_weight: rand(50..60),
      training_menu: nil,
      meal_menu: nil,
      body_fat_percentage: rand(10..20),
      total_calorie: rand(1500..2500),
      recording_date: "2020-#{rand(10..12)}-#{10..28}",
      user_id: times,
    )
  end
end

  10.times do 
    Post.create!(
      body_weight: rand(60..70),
      training_menu: nil,
      meal_menu: nil,
      body_fat_percentage: rand(15..25),
      total_calorie: rand(2000..2500),
      recording_date: "2020-#{rand(10..12)}-#{10..28}",
      user_id: 100,
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