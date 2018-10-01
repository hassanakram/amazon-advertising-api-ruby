module AmazonAdvertisingApiRuby
  class BaseRequest

    def self.get_request(api_path, opts = {})


      url = "#{AmazonAdvertisingApiRuby.active_api_url}#{api_path}"
      url = api_path if opts[:full_path]

      headers_hash = {
          "Authorization" => "Bearer #{access_token['access_token']}",
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

      response = JSON.parse(resp) if resp
      return response

    end
  end
end

