class AddProfileIdToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :profile_id, :integer
  end
end
