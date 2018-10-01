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
      begin
        response = RestClient::Request.execute(request_config)
      rescue RestClient::ExceptionWithResponse => err
        puts err
      end
      JSON.parse(response)
    end

  end
end
