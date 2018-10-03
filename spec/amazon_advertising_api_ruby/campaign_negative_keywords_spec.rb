require "spec_helper"

RSpec.describe AmazonAdvertisingApiRuby::Keyword::CampaignNegativeKeywords do
  include_context "shared setup"

  describe "CampaignNegativeKeywords crud operations" do
    before (:all) do
      set_configurations
    end
    before (:each) do
      @campaign_negative_keyword = AmazonAdvertisingApiRuby::Keyword::CampaignNegativeKeywords.create({

       "campaignId" => 232518632675541,
       "keywordText" => "Hello",
       "state" => "enabled",
       "matchType" => "negativePhrase"
                                                                                                     })
    end
    it 'Create CampaignNegativeKeywords' do
      expect(@campaign_negative_keyword[0]["code"]).to include('SUCCESS')
    end

    it 'list CampaignNegativeKeywords' do
      campaign_negative_keyword = AmazonAdvertisingApiRuby::Keyword::CampaignNegativeKeywords.list()
      expect(campaign_negative_keyword.count).to be >= 0
    end

    it 'archived CampaignNegativeKeywords' do
      campaign_negative_keyword = AmazonAdvertisingApiRuby::Keyword::CampaignNegativeKeywords.archived(@campaign_negative_keyword.first["keywordId"])
      expect(campaign_negative_keyword["code"]).to include('SUCCESS')
    end

    it 'get CampaignNegativeKeywords' do
      campaign_negative_keyword = AmazonAdvertisingApiRuby::Keyword::CampaignNegativeKeywords.retrieve(@campaign_negative_keyword.first["keywordId"])
      expect(campaign_negative_keyword["keywordId"]).not_to be nil
    end

    it 'get CampaignNegativeKeywords extended ' do
      campaign_negative_keyword = AmazonAdvertisingApiRuby::Keyword::CampaignNegativeKeywords.get_extended(@campaign_negative_keyword.first["keywordId"])
      expect(campaign_negative_keyword["keywordId"]).not_to be nil
    end

    it 'update CampaignNegativeKeywords' do
      campaign_negative_keyword = AmazonAdvertisingApiRuby::Keyword::CampaignNegativeKeywords.update({
       "keywordId" => @campaign_negative_keyword.first["keywordId"],
       "state" => "paused",
         })
      expect(campaign_negative_keyword[0]["code"]).to include('SUCCESS')
    end


  end
end

