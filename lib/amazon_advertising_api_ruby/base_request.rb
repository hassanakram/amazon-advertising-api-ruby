module AmazonAdvertisingApiRuby
  class BaseRequest

    def self.send_request(api_path, method = 'get', payload = nil, opts = {})
      url = "#{AmazonAdvertisingApiRuby.active_api_url}#{api_path}"
      url = api_path if opts[:full_path]
      request_config = {
        method: method,
        url: url,
        headers:{
            "Authorization" => AmazonAdvertisingApiRuby.access_token,
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
      rescue RestClient::ExceptionWithResponse => err
        puts err
        if err.response.code == 307
          return RestClient.get(err.response.headers[:location])
        end
      end
      JSON.parse(response)
    end

    def self.profile_request(api_path, opt={})
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


  end
end
