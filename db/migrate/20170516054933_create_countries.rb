class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.references :subconti, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
