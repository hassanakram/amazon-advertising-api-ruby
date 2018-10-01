require "oauth2"
require "rest-client"
require "pry"
require "amazon_advertising_api_ruby/version"
require "amazon_advertising_api_ruby/base_request"
require "amazon_advertising_api_ruby/token"
require "amazon_advertising_api_ruby/campaign"


module AmazonAdvertisingApiRuby
  TOKEN_URL = "https://api.amazon.com"
  API_URL = "https://advertising-api.amazon.com"
  TEST_API_URL = "https://advertising-api-test.amazon.com"
  EU_API_URL = "https://advertising-api-eu.amazon.com"

  def self.client
    return OAuth2::Client.new(
      "",
      "",
      :site => TOKEN_URL
    )
  end

  # By default this gem will use the production API url unless the test_env module
  # variable is set to true. Then the test API url will be used
  def self.active_api_url
    if test_env
      return TEST_API_URL
    end
    if eu_env
      return EU_API_URL
    end

    return API_URL
  end

  class << self
    attr_accessor :client_secret, :client_id, :refresh_token, :profile_id, :test_env, :eu_env, :initializing_time, :access_token
  end
end
