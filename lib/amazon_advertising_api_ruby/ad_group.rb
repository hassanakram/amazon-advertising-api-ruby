module AmazonAdvertisingApiRuby
  class AdGroup < BaseRequest

    API_GET_URL = "/v1/adGroups/"
    API_GET_EXTENDED_URL = "/v1/adGroups/extended/"
    API_LIST_URL = "/v1/adGroups/?"
    API_CREATE_URL = "/v1/adGroups"
    FIELDS = ['name', 'campaignId', 'state', 'defaultBid']

  end
end
