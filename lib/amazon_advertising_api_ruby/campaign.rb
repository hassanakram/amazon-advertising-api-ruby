module AmazonAdvertisingApiRuby
  class Campaign < BaseRequest

    API_GET_URL = "/v1/campaigns/"
    API_GET_EXTENDED_URL = "/v1/campaigns/extended/"
    API_URL = "/v1/campaigns/"
    FIELDS = ['name', 'campaignType', 'targetingType', 'state', 'dailyBudget', 'startDate']
    UPDATE_FIELD = 'campaignId'
    MUTABLE_FIELD = ['state', 'dailyBudget', 'startDate', 'endDate', 'premiumBidAdjustment', 'campaignId']

  end
end
