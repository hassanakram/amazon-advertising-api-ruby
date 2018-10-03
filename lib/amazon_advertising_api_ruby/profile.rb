module AmazonAdvertisingApiRuby
  class Profile  < BaseRequest
    API_GET_URL = "/v1/profiles/"
    API_LIST_URL = "/v1/profiles"
    UPDATE_FIELD = 'profileId'

    def self.list
      send_request("/v1/profiles", "get", nil, profile: true)
    end

    def self.register(payloads = {countryCode: "US"})
      send_request("/v1/profiles/register", "put", payloads)
    end

    def self.create(payloads = {countryCode: "US"})
      register_profile_id = register(payloads)
      retrieve(register_profile_id["profileId"])
    end
  end
end
