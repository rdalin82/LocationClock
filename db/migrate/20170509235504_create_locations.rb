class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.references :response, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
