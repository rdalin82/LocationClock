class ResponseParams
  def initialize(response)
    @version = version_response(response)
    @offset = offset_response(response)
    @suffix = suffix_response(response)
    @localtime = localtime_response(response)
    @isotime = isotime_response(response)
    @utctime = utctime_response(response)
    @dst = dst_response(response)
  end

  def version_response(response)
    response.xpath("//version").inner_text
  end

  def offset_response(response)
    response.xpath("//offset").inner_text
  end

  def suffix_response(response)
    response.xpath("//suffix").inner_text
  end

  def localtime_response(response)
    response.xpath("//localtime").inner_text
  end

  def isotime_response(response)
    response.xpath("//isotime").inner_text
  end

  def utctime_response(response)
    response.xpath("//utctime").inner_text
  end

  def dst_response(response)
    response.xpath("//dst").inner_text
  end

  def params
    {
      version: @version,
      offset: @offset,
      suffix: @suffix,
      localtime: @localtime,
      isotime: @isotime,
      utctime: @utctime,
      dst: @dst
    }
  end
end
