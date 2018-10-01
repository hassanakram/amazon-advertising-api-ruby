module AmazonAdvertisingApiRuby
  class Campaign < BaseRequest
    def self.create(params = {}, opts = {})

      fileds = ['name', 'campaignType', 'targetingType', 'state', 'dailyBudget', 'startDate']
      fileds.map {|a|
        if params[a].nil? then
          raise ArgumentError.new("params hash must contain name, campaignType, targetingType, state, dailyBudget and startDate")
        end}

      send_request("/v1/campaigns", 'post', [params])
    end

    def self.get_campaign(campaign_id)
      send_request("/v1/campaigns/#{campaign_id}")
    end

    def self.get_extended(campaign_id)
      send_request("/v1/campaigns/extended/#{campaign_id}")
    end

    def self.archived(campaign_id)
      send_request("/v1/campaigns/#{campaign_id}", 'delete')
    end


    private

    def self.setup_url_params(params)
      fields = ['startIndex', 'count', 'campaignType', 'stateFilter', 'name', 'campaignIdFilter']
      url_params = ""
      fields.map {|a|
        if params[a] then
          url_params += "&" if url_params.size > 0
          url_params += a + "=" + params[a]
        end
      }
      return url_params
    end

  end
end
