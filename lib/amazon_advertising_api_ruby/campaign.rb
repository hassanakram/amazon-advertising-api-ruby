module AmazonAdvertisingApiRuby
  class Campaign < BaseRequest

    API_GET_URL = "/v1/campaigns/"
    API_GET_EXTENDED_URL = "/v1/campaigns/extended/"
    API_LIST_URL = "/v1/campaigns/?"
    API_CREATE_URL = "/v1/campaigns"
    FIELDS = ['name', 'campaignType', 'targetingType', 'state', 'dailyBudget', 'startDate']
  end
end
