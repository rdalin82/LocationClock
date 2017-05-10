class Location < ActiveRecord::Base
  belongs_to :response
  validates :latitude, :longitude, presence: true 
end
