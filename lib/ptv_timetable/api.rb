require 'httparty'
require 'time'

module PtvTimetable

  class API
    include HTTParty

    base_uri 'http://timetableapi.ptv.vic.gov.au'

    def initialize(devid, secret_key)
      @devid      = devid
      @secret_key = secret_key
    end

    def health_check
      timestamp = Time.now.utc.iso8601
      signed_request("/v2/healthcheck?timestamp=#{timestamp}")
    end

    def near_me(latitude, longitude)
      signed_request("/v2/nearme/latitude/#{latitude}/longitude/#{longitude}")
    end

    def points_of_interest(latitude1, longitude1, latitude2, longitude2)
      poi        = '0,1,2,3,4,100'
      grid_depth = 3
      limit      = 6
      signed_request("/v2/poi/#{poi}/lat1/#{latitude1}/long1/#{longitude1}/lat2/#{latitude2}/long2/#{latitude2}/griddepth/#{grid_depth}/limit/#{limit}")
    end

    def search(text)
      signed_request("/v2/search/#{text}")
    end

    def broad_next_departures(mode, stop, limit=5)
      signed_request("/v2/mode/#{mode}/stop/#{stop}/departures/by-destination/limit/#{limit}")
    end

    def specific_next_departures(mode, line, stop, direction, limit=5, utc=Time.now.utc.iso8601)
      signed_request("/v2/mode/#{mode}/line/#{line}/stop/#{stop}/directionid/#{direction}/departures/all/limit/#{limit}?for_utc=#{utc}")
    end

    def stopping_pattern(mode, run, stop, utc=Time.now.utc.iso8601)
      signed_request("/v2/mode/#{mode}/run/#{run}/stop/#{stop}/stopping-pattern?for_utc=#{utc}")
    end

    def line_stops(mode, line)
      signed_request("/v2/mode/#{mode}/line/#{line}/stops-for-line")
    end

    private

    def signed_request(request_path)
      request_path += (request_path.include?('?') ? '&' : '?') + "devid=#{@devid}"
      signature = Digest::HMAC.hexdigest(request_path, @secret_key, Digest::SHA1).upcase
      self.class.get "#{request_path}&signature=#{signature}"
    end

  end

end
