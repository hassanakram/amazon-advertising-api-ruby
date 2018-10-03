require "amazon_advertising_api_ruby/base_request"
require "amazon_advertising_api_ruby/ad_group"
require "amazon_advertising_api_ruby/campaign"
require "amazon_advertising_api_ruby/product_ad"
require "amazon_advertising_api_ruby/profile"
require "amazon_advertising_api_ruby/report"
require "amazon_advertising_api_ruby/token"
require "amazon_advertising_api_ruby/version"
require "amazon_advertising_api_ruby/snapshot"
require "amazon_advertising_api_ruby/suggested_keyword"
require "amazon_advertising_api_ruby/ad_group_biddable_keywords"
require "amazon_advertising_api_ruby/ad_group_negative_keywords"
require "amazon_advertising_api_ruby/campaign_negative_keywords"
require "oauth2"
require "pry"
require "rest-client"

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
    case current_env
    when 'test'
      TEST_API_URL
    when 'eu'
      EU_API_URL
    else
      API_URL
    end
  end

  class << self
    attr_accessor :client_secret, :client_id, :refresh_token, :profile_id, :current_env, :initializing_time, :access_token
  end
end
