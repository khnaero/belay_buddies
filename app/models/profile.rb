class Profile < ApplicationRecord
  belongs_to :user
  has_many :reviews

  # because 'country' is the column name, must change other variables
  def country_name
    countryn = ISO3166::Country[country]
    countryn.translations[I18n.locale.to_s] || countryn.name
  end
end
