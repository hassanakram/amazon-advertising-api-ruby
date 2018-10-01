module AmazonAdvertisingApiRuby
  class Campaign < BaseRequest
    def self.create(params = {}, opts = {})
      # required argument checks
      #To do
      if !params["name"] && !params["campaignType"] && !params["targetingType"] && !params["state"] && !params["dailyBudget"] && !params["startDate"]
        raise ArgumentError.new("params hash must contain name, campaignType, targetingType, state, dailyBudget and startDate")
      end

      post_request("/v1/campaigns", [params])
    end
  end
end
