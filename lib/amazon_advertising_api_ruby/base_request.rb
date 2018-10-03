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

      request_config[:headers]["Authorization"] = "Bearer " + request_config[:headers]["Authorization"] if opts[:profile]

      if opts[:gzip]
        request_config[:headers]["Content-Encoding"] = "gzip"
        request_config[:max_redirects] = 0
      end

      begin
        response = RestClient::Request.execute(request_config)
        return JSON.parse(response)
      rescue RestClient::ExceptionWithResponse => err
        if err.response.code == 307
          return RestClient.get(err.response.headers[:location])
        end
        return err
      end

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

    def self.setup_url_params(params)
      fields = ['startIndex', 'count', 'campaignType', 'stateFilter', 'name', 'campaignIdFilter', 'adGroupIdFilter']
      return map_url(params, fields)
    end

    def self.map_url(params, fields)
      url_params = ""
      fields.map {|a|
        if params[a] then
          url_params += "&" if url_params.size > 0
          url_params += "?" if url_params.size == 0
          url_params += + a + "=" + params[a].to_s
        end
      }
      url_params
    end

  end
end
