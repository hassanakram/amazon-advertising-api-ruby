module AmazonAdvertisingApiRuby
  class Token < BaseRequest

    def self.retrieve
      one_hour_ago = (Time.now - 1 * 60 * 60)
      if (AmazonAdvertisingApiRuby.initializing_time.nil?) || (AmazonAdvertisingApiRuby.initializing_time < one_hour_ago.to_datetime)
        response = AmazonAdvertisingApiRuby::client.request(:post, "/auth/o2/token",
          {
            body: {
              grant_type: "refresh_token",
              client_id: AmazonAdvertisingApiRuby.client_id,
              refresh_token: AmazonAdvertisingApiRuby.refresh_token,
              client_secret: AmazonAdvertisingApiRuby.client_secret
            }
          }
        )
        AmazonAdvertisingApiRuby.initializing_time = DateTime.now
        AmazonAdvertisingApiRuby.access_token = JSON.parse(response.body)["access_token"]
      else
        AmazonAdvertisingApiRuby.access_token
      end
    end

    def self.authorize(auth_code)
      response = AmazonAdvertisingApiRuby::client.request(:post, "/auth/o2/token",
        {
          body: {
            grant_type: "authorization_code",
            client_id: AmazonAdvertisingApiRuby.client_id,
            code: auth_code,
            client_secret: AmazonAdvertisingApiRuby.client_secret,
            redirect_uri: "https://vividcommerce.io/authenticatemws"
          }
        }
      )
      return JSON.parse(response.body)
    end



  end
end
