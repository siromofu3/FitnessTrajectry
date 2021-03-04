class Post < ApplicationRecord
  validates :body_weight, { presence: true }
  validates :recording_date, { presence: true }
  validates :user_id, { presence: true }

  def user
    return User.find_by(id: self.user_id)
  end


end
