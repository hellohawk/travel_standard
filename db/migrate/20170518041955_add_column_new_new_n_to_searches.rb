class AddColumnNewNewNToSearches < ActiveRecord::Migration
  def change
    remove_column :searches, :city_code, :string
  end
end
