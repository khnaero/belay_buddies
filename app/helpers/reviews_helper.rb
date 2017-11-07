module ReviewsHelper
  def create_or_edit_review_path(profile)
    user_review = current_user.profile_review(profile) if user_signed_in?

    if user_signed_in? && user_review.present?
      link_to "Edit review", edit_review_path(profile, user_review)
    else
      link_to "Write a review", new_profile_review_path(@profile)
    end
  end
end
