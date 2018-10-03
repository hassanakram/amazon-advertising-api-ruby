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
      expect(@campaigns[0]["code"]).to include('SUCCESS')
    end

    it 'get campaign' do
      campaign = AmazonAdvertisingApiRuby::Campaign.retrieve(@campaigns.first["campaignId"])
      expect(campaign["campaignId"]).not_to be nil
    end

    it 'get campaign with extended fields' do
      campaign = AmazonAdvertisingApiRuby::Campaign.get_extended(@campaigns.first["campaignId"])
      expect(campaign["campaignId"]).not_to be nil
    end

    it 'delete campaign' do
      campaign = AmazonAdvertisingApiRuby::Campaign.archived(@campaigns.first["campaignId"])
      expect(campaign["campaignId"]).not_to be nil and expect(campaign["code"]).to include "SUCCESS"
    end

    it 'list campaigns' do
      campaign = AmazonAdvertisingApiRuby::Campaign.list()
      expect(campaign.count).to be >= 1
    end

    it "checks invlid campaign data" do
      invalid_campaigns = AmazonAdvertisingApiRuby::Campaign.create({
        "name" => "invalid",
        "campaignType" => "invalid",
        "state" => "invalid",
        "dailyBudget" => "aa",
        "startDate" => (Time.now).strftime('%Y%m%d'),
        "targetingType" => "invalid"
      })
      expect(invalid_campaigns.to_s).to include('422') #Unprocessable Entity Error
    end

    it "checks all parameters are passed" do
      invalid_campaigns = AmazonAdvertisingApiRuby::Campaign.create({
        # "name" => "invalid",
        "campaignType" => "invalid",
        "state" => "invalid",
        "dailyBudget" => "aa",
        "startDate" => (Time.now).strftime('%Y%m%d'),
        "targetingType" => "invalid"
      })
      expect(invalid_campaigns.to_s).to include('Parameter missing') #missing parameter error
    end

  end

end
