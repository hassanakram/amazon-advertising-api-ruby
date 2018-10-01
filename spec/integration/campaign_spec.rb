require "spec_helper"

RSpec.describe AmazonAdvertisingApiRuby::Campaign do

  describe "campaign crud operations" do
    it "creates, lists and finds campaigns" do
      campaigns = AmazonAdvertisingApiRuby::Campaign.create({
                                             "name" => "test",
                                             "campaignType" => "sponsoredProducts",
                                             "state" => "enabled",
                                             "dailyBudget" => 10,
                                             "startDate" => (Time.now).strftime('%Y%m%d'),
                                             "targetingType" => "abc"
                                         })

      expect(campaigns).not_to be nil
      payload_response = AmazonAdvertisingApiRuby::Campaign.retrieve(campaigns.first["campaignId"])
      payload_response = AmazonAdvertisingApiRuby::Campaign.list()
    end
  end

end

