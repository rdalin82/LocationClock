class CreateTimeRequests < ActiveRecord::Migration
  def change
    create_table :time_requests do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.datetime :current_time
      t.string :request_session

      t.timestamps null: false
    end
  end
end
