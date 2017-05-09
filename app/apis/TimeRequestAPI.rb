require 'open-uri'
class TimeRequestAPI
  attr_reader :latitude, :longitude, :request_session, :current_time
  def initialize(latitude, longitude, request_session)
    validate_presence_of_arguments(latitude, longitude)
    validate_latitude(latitude)
    validate_longitude(longitude)
    @latitude = latitude
    @longitude = longitude
    @request_session = request_session
    @current_time = current_time_request || nil
  end

  def current_time_request
    response = Nokogiri::XML(open("http://new.earthtools.org/timezone-1.1/#{@latitude}/#{@longitude}"))
    DateTime.parse(response.xpath("//localtime").inner_text)
  end
  def params
    {
      latitude: @latitude,
      longitude: @longitude,
      current_time: @current_time,
      request_session: @request_session
    }
  end

  private
  def validate_latitude(latitude)
    unless latitude.to_f > -90 && latitude.to_f < 90
      raise ArgumentError.new("Latitude must be between -90 and 90")
    end
  end

  def validate_longitude(longitude)
    unless longitude.to_f > -180 && longitude.to_f < 180
      raise ArgumentError.new("Longitude must be between -180 and 180")
    end
  end
  def validate_presence_of_arguments(latitude, longitude)
    if (latitude == "" || longitude == "")
      raise ArgumentError.new("You must supply both a Latitude and Longitude")
    end
  end
end
