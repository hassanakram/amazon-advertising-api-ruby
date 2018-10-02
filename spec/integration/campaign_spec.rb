require "spec_helper"

RSpec.describe AmazonAdvertisingApiRuby::Campaign do
  before (:all) do
    set_configurations
  end
  before (:each) do
    @campaigns = AmazonAdvertisingApiRuby::Campaign.create({
                                                               "name" => "test",
                                                               "campaignType" => "sponsoredProducts",
                                                               "state" => "enabled",
                                                               "dailyBudget" => 10,
                                                               "startDate" => (Time.now).strftime('%Y%m%d'),
                                                               "targetingType" => "abc"
                                                           })
  end
  describe "campaign crud operations" do
    it "create campaign" do
      expect(@campaigns).not_to be nil
    end
    it 'list campaign' do
      campaign = AmazonAdvertisingApiRuby::Campaign.get(@campaigns.first["campaignId"])
      expect(campaign).not_to be nil
    end
    it 'list campaign and extended fields' do
      campaign = AmazonAdvertisingApiRuby::Campaign.get_extended(@campaigns.first["campaignId"])
      expect(campaign).not_to be nil
    end

    it 'delete campaign' do
      campaign = AmazonAdvertisingApiRuby::Campaign.archived(@campaigns.first["campaignId"])
      expect(campaign).not_to be nil
    end

    it 'list campaigns' do
      campaign = AmazonAdvertisingApiRuby::Campaign.list()
      expect(campaign).not_to be nil
    end

  end

end

