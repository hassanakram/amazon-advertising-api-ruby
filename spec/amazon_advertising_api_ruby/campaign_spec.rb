require "spec_helper"

RSpec.describe AmazonAdvertisingApiRuby::Campaign do
  include_context "shared setup"

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
    it 'get campaign' do
      campaign = AmazonAdvertisingApiRuby::Campaign.retrieve(@campaigns.first["campaignId"])
      expect(campaign).not_to be nil
    end
    it 'get campaign with extended fields' do
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

    it 'update campaign' do
      campaign = AmazonAdvertisingApiRuby::Campaign.update({
        "campaignId" => @campaigns.first["campaignId"],
        "name" => "Updated campaign xyz12",
        "state" => "enabled",
        "dailyBudget" => 0.5,
        "startDate" => (Time.now).strftime('%Y%m%d'),
        "endDate" => ((Time.now + 10 * 60 * 60).strftime('%Y%m%d')),
        "premiumBidAdjustment" => false
      })
      expect(campaign[0]["code"]).to include('SUCCESS')
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
      expect(invalid_campaigns.response.code).to equal(422) #Unprocessable Entity Error
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
      expect(invalid_campaigns.response.code).to equal(422) #missing parameter error
    end

  end

end

