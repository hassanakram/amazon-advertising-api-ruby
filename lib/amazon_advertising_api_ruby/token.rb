module AmazonAdvertisingApiRuby
  class Token

    def self.retrieve
      if AmazonAdvertisingApiRuby.initializing_time < 1.hour.ago
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

  end
end
