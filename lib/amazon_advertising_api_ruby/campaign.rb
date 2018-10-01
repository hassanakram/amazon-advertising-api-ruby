module AmazonAdvertisingApiRuby
  class Campaign
    def self.create(params = {}, opts = {})
      # required argument checks
      if !params["name"] && !params["campaignType"] && !params["targetingType"] && !params["state"] && !params["dailyBudget"] && !params["startDate"]
        raise ArgumentError.new("params hash must contain name, campaignType, targetingType, state, dailyBudget and startDate")
      end

      post_request("/v1/campaigns", [params])
    end
  end
end
