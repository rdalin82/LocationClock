class TimeRequest < ActiveRecord::Base
  validates :latitude, :longitude, :request_session, presence: true
end
