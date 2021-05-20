class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :gender
      t.string :icon_image_name
      t.date :birthday
      t.integer :user_height
      t.text :description

      t.timestamps
    end
  end
end
