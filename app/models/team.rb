class Team < ApplicationRecord
  has_many :users

  def score
    users.includes(:board).inject(0){ |sum, user| sum + user.score }
  end
end
