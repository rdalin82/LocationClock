class Response < ActiveRecord::Base
  belongs_to :time_request
  has_one :location 
end
