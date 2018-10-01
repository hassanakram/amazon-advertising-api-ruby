module AmazonAdvertisingApiRuby
  class BaseRequest

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

    def self.get_request(api_path, opts = {})

      url = "#{AmazonAdvertisingApiRuby.active_api_url}#{api_path}"
      url = api_path if opts[:full_path]

      headers_hash = {
          "Authorization" => "Bearer #{AmazonAdvertisingApiRuby.access_token}",
          "Content-Type" => "application/json",
          "Amazon-Advertising-API-Scope" => AmazonAdvertisingApiRuby.profile_id
      }
      headers_hash["Content-Encoding"] = "gzip" if opts[:gzip]
      # headers_hash.delete("Authorization") if opts[:no_token]
      request_config = {
          method: :get,
          url: url,
          headers: headers_hash,
          max_redirects: 0
      }
      begin
        response = HTTParty.get(request_config)
      rescue HTTParty::Error => err
        # If this happens, then we are downloading a report from the api, so we can simply download the location
        if err.response.code == 307
          return HTTParty.get(err.response.headers[:location])
        end
      end

      response = JSON.parse(response) if response
      return response

    end

    def self.post_request(api_path, payload)

      # access_token = AmazonAdvertisingApiRuby::Token.retrieve()
      request_config = {
          method: :post,
          url: "#{AmazonAdvertisingApiRuby::API_URL}#{api_path}",
          payload: payload.to_json,
          headers: {
              :Authorization => "Bearer #{AmazonAdvertisingApiRuby.access_token}",
              "Content-Type" => "application/json",
              "Amazon-Advertising-API-Scope" => AmazonAdvertisingApiRuby.profile_id.to_i
          }
      }
      response = HTTParty.post(request_config)
      return JSON.parse(response)
    end
  end
end

