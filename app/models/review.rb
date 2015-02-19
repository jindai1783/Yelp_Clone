class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user
  validates :rating, inclusion: (1..5)

  # validates :user, uniqueness: {scope: :restaurant}

  # def good_review
  #   return self.user_id.to_s + '/' + self.restaurant_id.to_s
  # end
end
