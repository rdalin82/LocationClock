class LocationParams
  def initialize(response)
    @latitude = latitude_response(response)
    @longitude = longitude_response(response)
  end

  def latitude_response(response)
    response.xpath("//location").xpath("//latitude").inner_text
  end

  def longitude_response(response)
    response.xpath("//location").xpath("//longitude").inner_text
  end

  def params
    {
      latitude: @latitude,
      longitude: @longitude
    }
  end
end
