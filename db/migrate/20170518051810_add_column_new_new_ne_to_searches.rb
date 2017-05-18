class AddColumnNewNewNeToSearches < ActiveRecord::Migration
  def change

    add_column :searches, :country, :string
    add_column :searches, :city, :string
    add_column :searches, :continent, :string
    add_column :searches, :subcontinent, :string

  end
end
