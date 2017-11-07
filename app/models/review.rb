class Review < ApplicationRecord
  belongs_to :user
  belongs_to :profile

  validates_uniqueness_of :user_id, :scope => :profile_id, :message=>"You can't review a product more than once", on: 'create'
  # validate :user_cannot_write_review_about_themselves, on: :create

  # def user_cannot_write_review_about_themselves
  #   if current_user.id == @profile.id
  #     errors.add(:reviewer, "cannot write a review about yourself")
  #   end
  # end
end
