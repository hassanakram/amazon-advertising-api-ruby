module AmazonAdvertisingApiRuby
  class BaseRequest

    UPDATE_FIELD = 'keywordId'
    MUTABLE_FIELD = ['state', 'keywordId']


    def self.send_request(api_path, method = 'get', payload = nil, opts = {})
      response = {}
      url = "#{AmazonAdvertisingApiRuby.active_api_url}#{api_path}"
      url = api_path if opts[:full_path]

      request_config = {
          method: method,
          url: url,
          headers: {
              "Authorization" => AmazonAdvertisingApiRuby::Token.retrieve,
              "Content-Type" => "application/json",
              "Amazon-Advertising-API-Scope" => AmazonAdvertisingApiRuby.profile_id
          },
          payload: payload.to_json
      }

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
      return raise_exception(422, "Parameter#{'s' if missing_params.count > 1} missing: #{missing_params.join(", ")}") if missing_params.count > 0
      send_request(self::API_URL, 'post', [params])
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
      send_request(self::API_URL + "#{setup_url_params(params)}")
    end

    def self.update(params = {}, opt = {})
      return raise_exception(422, "#{self::UPDATE_FIELD} is required") if params.key?("#{self::UPDATE_FIELD}") == false
      extra_parms = []
      params.keys.map {|key|
        unless self::MUTABLE_FIELD.include? key then
          extra_parms.push(key)
        end
      }

      return raise_exception(422, "Parameter#{'s' if extra_parms.count > 1} missing: #{extra_parms.join(", ")}") if extra_parms.count > 0
      send_request(self::API_URL, 'put', [params])
    end

    def self.request_record_type(params = {}, opts = {})
      raise ArgumentError.new("params hash must contain a recordType") unless params["recordType"]
      send_request(self::REQUEST_URL%params.delete("recordType"), "post", params)
    end

    def self.download(location, opts = {})
      opts.merge!({:full_path => true, :gzip => true})
      response_body = send_request(location, "get", nil, opts)
      dir = "public/reports/"
      local_dir = FileUtils.mkdir_p(dir)
      file_path = dir + opts[:recordType]+ "-" + Date.today.to_s + ".json.gz"

      File.open(file_path, 'wb') do |file|
        file << response_body
      end
      file_path
    end

    def self.setup_url_params(params)
      fields = ['startIndex', 'count', 'campaignType', 'stateFilter', 'name', 'campaignIdFilter', 'adGroupIdFilter', 'keywordText', 'matchTypeFilter', 'keywordIdFilter', 'sku', 'asin']
      return map_url(params, fields)
    end

    def self.map_url(params, fields)
      url_params = ""
      fields.map {|a|
        if params[a] then
          url_params += "&" if url_params.size > 0
          url_params += "?" if url_params.size == 0
          url_params += +a + "=" + params[a].to_s
        end
      }
      url_params
    end

    def self.raise_exception(code, message)
      OpenStruct.new({response: OpenStruct.new({code: code, message: message})})
    end
  end
end
