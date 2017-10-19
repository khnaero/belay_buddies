class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :acceptance
      t.string :city
      t.string :state_province
      t.string :country
      t.text :description
      t.string :aid
      t.string :trad
      t.string :bouldering
      t.string :sport

      t.timestamps
    end
  end
end
