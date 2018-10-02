module AmazonAdvertisingApiRuby
  class Profile  < BaseRequest

    def self.list
      send_request("/v1/profiles", "get", nil, profile: true)
    end

    def self.register(payloads = {countryCode: "US"})
      send_request("/v1/profiles/register", "put", payloads, profile: true)
    end

    def self.retrieve(profile_id)
      send_request("/v1/profiles/#{profile_id}", "get", nil, profile: true)
    end

    def self.create(payloads = {countryCode: "US"})
      register_profile_id = register(payloads)
      retrieve(register_profile_id["profileId"])
    end
  end
end

