class CreateContis < ActiveRecord::Migration
  def change
    create_table :contis do |t|

      t.timestamps null: false
    end
  end
end
