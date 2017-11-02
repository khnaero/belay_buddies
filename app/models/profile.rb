class Profile < ApplicationRecord
  belongs_to :user
  has_many :reviews

  def country_name
    country = self.country
    ISO3166::Country[country]
  end
end

# because 'country' is the column name, must change other variables
# def country_name
#   iso_country = ISO3166::Country[country]
#   iso_country.translations[I18n.locale.to_s] || iso_country.name
# end
# code above from documentation did not work!