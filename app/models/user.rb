class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :reviews, dependent: :destroy
  before_create :build_profile
  accepts_nested_attributes_for :profile 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username,
            presence: true

  # def profile_review(profile)
  #   Review.find_by(user_id: self, profile_id: profile)
  # end
end
