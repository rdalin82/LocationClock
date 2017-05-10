class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :version
      t.integer :offset
      t.string :suffix
      t.string :localtime
      t.string :isotime
      t.string :utctime
      t.string :dst
      t.references :time_request, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
