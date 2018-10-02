module AmazonAdvertisingApiRuby
  class BaseRequest

    API_GET_URL = ''
    API_GET_EXTENDED_URL = ''
    API_LIST_URL = ''
    API_CREATE_URL = ''
    FIELDS = ''


    def self.send_request(api_path, method = 'get', payload = nil, opts = {})
      response = {}
      url = "#{AmazonAdvertisingApiRuby.active_api_url}#{api_path}"
      url = api_path if opts[:full_path]
      request_config = {
          method: method,
          url: url,
          headers: {
              "Authorization" => AmazonAdvertisingApiRuby.access_token,
              "Content-Type" => "application/json",
              "Amazon-Advertising-API-Scope" => AmazonAdvertisingApiRuby.profile_id
          },
          payload: payload.to_json
      }
      begin
        response = RestClient::Request.execute(request_config)
        return JSON.parse(response)
      rescue RestClient::ExceptionWithResponse => err
        return err
      end
    end

    def self.profile_request(api_path, opt = {})
      payloads = opt[:method] == 'get' ? {} : {countryCode: opt[:country_code]}
      request_config = {
          method: (opt[:method].to_sym),
          url: "#{AmazonAdvertisingApiRuby.active_api_url}#{api_path}",
          payload: payloads.to_json,
          headers: {
              "Authorization" => "Bearer #{AmazonAdvertisingApiRuby.access_token}",
              "Content-Type" => "application/json"
          }
      }
      resp = RestClient::Request.execute(request_config)
      JSON.parse(resp)
    end


    def self.create(params = {}, opts = {})
      missing_params = []
      self::FIELDS.map {|field|
        if params[field].nil? then
          missing_params.push(field)
        end
      }
      raise ArgumentError.new("Parameter#{'s' if missing_params.count > 1} missing: #{missing_params.join(", ")}") if missing_params.count > 0
      send_request(self::API_CREATE_URL, 'post', [params])
    end

    def self.retrieve(id)
      send_request(self::API_GET_URL + "#{id}")
    end

    def self.get_extended(id)
      send_request(self::API_GET_EXTENDED_URL + "#{id}")
    end

    def self.archived(id)
      send_request(self::API_GET_URL + "#{id}", 'delete')
    end

    def self.list(params = {}, opts = {})
      send_request(self::API_LIST_URL + "#{setup_url_params(params)}")
    end

    private

    def self.setup_url_params(params)
      fields = ['startIndex', 'count', 'campaignType', 'stateFilter', 'name', 'campaignIdFilter', 'adGroupIdFilter']
      url_params = ""
      fields.map {|a|
        if params[a] then
          url_params += "&" if url_params.size > 0
          url_params += a + "=" + params[a]
        end
      }
      return url_params
    end


  end
end
