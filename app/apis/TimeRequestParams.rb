class TimeRequestParams
  def initialize(time_api)
    @latitude = time_api.latitude
    @longitude = time_api.longitude
    @request_session = time_api.request_session
    @current_time = current_time_request(time_api.response)
  end

  def current_time_request(response)
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
end
