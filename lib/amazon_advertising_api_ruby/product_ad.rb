module AmazonAdvertisingApiRuby
  class ProductAd < BaseRequest

    API_GET_URL = "/v1/productAds/"
    API_GET_EXTENDED_URL = "/v1/productAds/extended/"
    API_LIST_URL = "/v1//productAds"
    API_CREATE_URL = "/v1/productAds"
    FIELDS = ['campaignId', 'adGroupId', 'SKU', 'state']
  end
end