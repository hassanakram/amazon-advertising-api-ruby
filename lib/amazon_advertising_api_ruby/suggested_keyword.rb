module AmazonAdvertisingApiRuby
  module Keyword
    class SuggestedKeyword < BaseRequest
      URLS = {
        adGroupId: "/v1/adGroups/%s/suggested/keywords",
        asinValue: "/v1/asins/%s/suggested/keywords",
        adGroupIdExtended: "/v1/adGroups/%s/suggested/keywords/extended",
        asinList: "/v1/asins/suggested/keywords"
      }
      FIELDS = ["maxNumSuggestions", "adStateFilter", "suggestBids"]

      def self.list(params = {}, opts = {})
        return send_request((URLS[opts[:suggestedBy].to_sym]), "post", params) if opts[:suggestedBy] == "asinList"

        query_string = map_url(params, FIELDS)
        send_request((URLS[opts[:suggestedBy].to_sym]%params[opts[:suggestedBy]] + query_string))
      end
    end
  end
end

