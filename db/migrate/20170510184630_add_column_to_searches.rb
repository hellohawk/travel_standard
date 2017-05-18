class AddColumnToSearches < ActiveRecord::Migration
  def change
    create_table :Searches do |t|
        t.string :upload_id
        t.string :city
        t.string :city_code
        t.string :country
        t.string :country_code
        t.string :area
        t.string :area_code
        t.integer :tour_count
        t.timestamps null: false
    end
  end
end
