class Review < ApplicationRecord
  belongs_to :user
  belongs_to :profile

  # validate :user_cannot_write_review_about_themselves, on: :create

  # def user_cannot_write_review_about_themselves
  #   if current_user.id == @profile.id
  #     errors.add(:reviewer, "cannot write a review about yourself")
  #   end
  # end
end
