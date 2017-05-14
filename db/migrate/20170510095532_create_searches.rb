class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.integer  :upload_id
      t.string   :area_id
      t.string   :country_id
      t.string   :city_id
      t.timestamps null: false
    end
  end
end
