require "spec_helper"

RSpec.describe AmazonAdvertisingApiRuby::Campaign do

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
      campaign_id = @campaigns.last
      campaign = AmazonAdvertisingApiRuby::Campaign.get_campaign(campaign_id['campaignId'])
      expect(campaign).not_to be nil
    end
    it 'list campaign and extended fields' do
      campaign_id = @campaigns.last
      campaign = AmazonAdvertisingApiRuby::Campaign.get_extended(campaign_id['campaignId'])
      expect(campaign).not_to be nil
    end

    it 'delete campaign' do
      campaign_id = @campaigns.last
      binding.pry
      campaign = AmazonAdvertisingApiRuby::Campaign.archived(campaign_id['campaignId'])

      expect(campaign).not_to be nil
    end

  end

end

