module AmazonAdvertisingApiRuby
  class ProductAd < BaseRequest

    API_GET_URL = "/v1/productAds/"
    API_GET_EXTENDED_URL = "/v1/productAds/extended/"
    API_URL = "/v1/productAds"
    FIELDS = ['campaignId', 'adGroupId', 'sku', 'state']
    UPDATE_BY = 'adId'
    MUTABLE_FIELD = ['state', 'adId']
  end
end

