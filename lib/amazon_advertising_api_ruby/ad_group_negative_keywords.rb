module AmazonAdvertisingApiRuby
  module Keyword
    class AdGroupNegativeKeywords < BaseRequest

      API_GET_URL = "/v1/negativeKeywords/"
      API_GET_EXTENDED_URL = "/v1/negativeKeywords/extended/"
      API_URL = "/v1/negativeKeywords"
      FIELDS = ['campaignId', 'adGroupId', 'keywordText', 'matchType', 'state']
    end
  end
end