class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  before_create :build_profile
  accepts_nested_attributes_for :profile 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username,
            presence: true
end
