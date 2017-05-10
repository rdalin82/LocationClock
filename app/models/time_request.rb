class TimeRequest < ActiveRecord::Base
  has_one :response 
  validates :latitude, :longitude, :request_session, presence: true
end
