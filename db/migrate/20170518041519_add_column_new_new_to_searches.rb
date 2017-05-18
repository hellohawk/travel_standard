class AddColumnNewNewToSearches < ActiveRecord::Migration
  def change

    add_column :searches, :country_name, :string
    add_column :searches, :city_name, :string
    add_column :searches, :conti_name, :string
    add_column :searches, :subconti_name, :string

    remove_column :searches, :area, :string
    remove_column :searches, :area_code, :string
    remove_column :searches, :city, :string
    remove_column :searches, :country, :string
    remove_column :searches, :country_code, :integer
    remove_column :searches, :tour_count, :integer

  end
end
