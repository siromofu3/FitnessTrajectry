class AddPostsColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :training_menu, :string
    add_column :posts, :meal_menu, :string
    add_column :posts, :body_fat_percentage, :integer
    add_column :posts, :total_calorie, :integer
    add_column :posts, :image_name, :string
    add_column :posts, :recording_date, :date
    add_column :posts, :user_id, :integer
    add_column :posts, :post_image_name, :string
  end
end
