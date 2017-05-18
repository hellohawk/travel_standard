class CreateSubcontis < ActiveRecord::Migration
  def change
    create_table :subcontis do |t|
      t.references :conti, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
