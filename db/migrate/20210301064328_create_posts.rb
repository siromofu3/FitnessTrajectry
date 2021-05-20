class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :body_weight
      t.timestamps
    end
  end
end
