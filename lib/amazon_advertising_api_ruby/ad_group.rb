module AmazonAdvertisingApiRuby
  class AdGroup < BaseRequest

    def self.get(ad_group_id)
      send_request("/v1/adGroups/#{ad_group_id}")
    end

    def self.create(params = {}, opt = {})
      fileds = ['name', 'campaignId', 'state', 'defaultBid']
      fileds.map {|a|
        if params[a].nil? then
          raise ArgumentError.new("params hash must contain name, campaignId, state and defaultBid")
        end}
      send_request("/v1/adGroups", 'post', [params])
    end

    def self.get_extended(ad_group_id)
      send_request("/v1/adGroups/extended/#{ad_group_id}")
    end

    def self.archived(ad_group_id)
      send_request("/v1/adGroups/#{ad_group_id}", 'delete')
    end

    def self.list(params = {}, opts = {})
      send_request("/v1/adGroups/?#{setup_url_params(params)}")
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
