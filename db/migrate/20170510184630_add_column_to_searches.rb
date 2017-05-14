class AddColumnToSearches < ActiveRecord::Migration
  def change

    add_column :searches, :city, :string
    add_column :searches, :city_code, :string
    add_column :searches, :country, :string
    add_column :searches, :country_code, :string
    add_column :searches, :area, :string
    add_column :searches, :area_code, :string
    add_column :searches, :tour_count, :integer

    remove_column :searches, :area_id, :integer
    remove_column :searches, :country_id, :integer
    remove_column :searches, :city_id, :integer

  end
end
