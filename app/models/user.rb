class User < ApplicationRecord
  validates :name, {presence: true}
  validates :email, {presence: true}
  validates :password, {presence: true}
  validates :gender, {presence: true}
  validates :birthday, {presence: true}

  def posts
    return Post.where(user_id: self.id).order(recording_date: :desc)
  end

  def age
    require "date"
    @today = Date.today.strftime("%Y%m%d").to_i
    return (@today - self.birthday.strftime("%Y%m%d").to_i) / 10000
  end

end
