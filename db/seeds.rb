
# Seed実行時にTruncateするテーブルはコメント外す
tables_to_initialize = [
  :users, 
  :posts,
  :likes, 
]

# 再投入対象のテーブルを初期化(products => pg)
tables_to_initialize.each do |table|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
  puts "truncated #{table}"
end

# 再投入対象のテーブルを初期化(develop => sqlite3)
#   tables_to_initialize.each do |table|
#     ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
#   end                                                                                                                               
#   ActiveRecord::Base.connection.execute("VACUUM")                                                                                               

 Faker::Config.locale = :ja
 

 # user
 10.times do |times|
  times += 1
   pokemon_name = Faker::Games::Pokemon.name
    User.create!(
      id: 500 + times,
      name: "#{pokemon_name}",
      email: "user-#{times}@sample.com",
      password: 'password',
      gender: rand(1..2),
      icon_image_name: 'default_user_image.jpg', 
      birthday: "#{rand(1980..2003)}-#{rand(1..12)}-#{1..28}",
      user_height: rand(153..175),
      description: "筋トレにハマってます！みなさん一緒に頑張りましょう！ちなみに好きなポケモンは#{pokemon_name}です！"
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

  User.create!(
    id: 101,
    name: "テストユーザー",
    email: "test@sample.com",
    password: 'password',
    gender: 1,
    icon_image_name: 'default_user_image.jpg', 
    birthday: "1990-01-01",
    user_height: 170,
    description: "筋トレにハマってます！みなさん一緒に頑張りましょう！"
  )


# posts
10.times do |times|
  times += 1
  10.times do 
    Post.create!(
      body_weight: rand(50..65),
      training_menu: "ベンチプレス40kg 10回 3セット\nスクワット 20回 3セット",
      meal_menu: "卵3個,鶏肉1kg,ご飯3合",
      body_fat_percentage: rand(15..25),
      total_calorie: rand(1500..2500),
      recording_date: "2020-#{rand(1..12)}-#{rand(1..28)}",
      user_id: 500 + times,
    )
  end
end

  10.times do 
    Post.create!(
      body_weight: rand(50..65),
      training_menu: "ベンチプレス60kg 10回 3セット\nスクワット 20回 3セット",
      meal_menu: "卵3個,鶏肉1kg,ご飯3合",
      body_fat_percentage: rand(15..25),
      total_calorie: rand(1500..2500),
      recording_date: "2020-#{rand(1..12)}-#{rand(1..28)}",
      user_id: 100,
    )
  end

  10.times do 
    Post.create!(
      body_weight: rand(57..70),
      training_menu: "ベンチプレス50kg 10回 3セット\nスクワット 20回 3セット",
      meal_menu: "卵3個,鶏肉1kg,ご飯3合",
      body_fat_percentage: rand(15..25),
      total_calorie: rand(1500..2500),
      recording_date: "2020-#{rand(1..12)}-#{rand(1..28)}",
      user_id: 101,
      post_image_name: "2.jpg",
    )
  end
