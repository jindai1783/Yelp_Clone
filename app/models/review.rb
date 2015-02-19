class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user
  validates :rating, inclusion: (1..5)

  validates :user_id, uniqueness: {scope: :restaurant_id}

  # def good_review
  #   return self.user_id.to_s + '/' + self.restaurant_id.to_s
  # end
end
