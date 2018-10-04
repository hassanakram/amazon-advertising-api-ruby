module AmazonAdvertisingApiRuby
  class AdGroup < BaseRequest

    API_GET_URL = "/v1/adGroups/"
    API_GET_EXTENDED_URL = "/v1/adGroups/extended/"
    API_URL = "/v1/adGroups/"
    FIELDS = ['name', 'campaignId', 'state', 'defaultBid']
    UPDATE_BY = 'adGroupId'
    MUTABLE_FIELD = ['name', 'defaultBid', 'state', 'adGroupId']

  end
end
