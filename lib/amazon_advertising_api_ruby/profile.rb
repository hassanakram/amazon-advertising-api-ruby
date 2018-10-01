module AmazonAdvertisingApiRuby
  class Profile  < BaseRequest

    def self.list
      profile_request("/v1/profiles", method: "get")
    end

    def self.register(country_code="US")
      profile_request("/v1/profiles/register", method: "put", country_code: country_code)
    end

    def self.retrieve(profile_id)
      profile_request("/v1/profiles/#{profile_id}", method: "get")
    end

    def self.create(country_code="US")
      register_profile_id = register(country_code)
      retrieve(register_profile_id["profileId"])
    end
  end
end

