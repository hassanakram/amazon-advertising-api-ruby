module AmazonAdvertisingApiRuby
  module Keyword
    class AdGroupBiddableKeywords < BaseRequest

      API_GET_URL = "/v1/keywords/"
      API_GET_EXTENDED_URL = "/v1/keywords/extended/"
      API_URL = "/v1/keywords"
      FIELDS = ['campaignId', 'adGroupId', 'keywordText','matchType', 'state']
      MUTABLE_FIELD = ['state', 'bid', 'keywordId']


    end
  end
end