module AmazonAdvertisingApiRuby
  module Keyword
    class CampaignNegativeKeywords < BaseRequest

      API_GET_URL = "/v1/campaignNegativeKeywords/"
      API_GET_EXTENDED_URL = "/v1/campaignNegativeKeywords/extended/"
      API_URL = "/v1/campaignNegativeKeywords"
      API_CREATE_URL = "/v1/campaignNegativeKeywords"
      FIELDS = ['campaignId', 'keywordText', 'matchType', 'state']

    end
  end
end