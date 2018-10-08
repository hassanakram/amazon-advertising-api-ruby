require "spec_helper"

RSpec.describe AmazonAdvertisingApiRuby::Keyword::AdGroupNegativeKeywords do
  include_context "shared setup"

  describe "AdGroupNegativeKeywords crud operations" do

    before (:each) do
      @ad_group_negative_keyword = AmazonAdvertisingApiRuby::Keyword::AdGroupNegativeKeywords.create({

        "campaignId" => 271182162872261,
        "adGroupId" => 275342011526335,
        "keywordText" => "32",
        "state" => "enabled",
        "matchType" => "negativePhrase"
      })
    end
    it 'Create AdGroupNegativeKeywords' do
      expect(@ad_group_negative_keyword[0]["code"]).to include('SUCCESS')
    end

    it 'list AdGroupNegativeKeywords' do
      ad_group_negative_keyword = AmazonAdvertisingApiRuby::Keyword::AdGroupNegativeKeywords.list()
      expect(ad_group_negative_keyword.count).to be >= 0
    end

    it 'archived AdGroupNegativeKeywords' do
      ad_group_negative_keyword = AmazonAdvertisingApiRuby::Keyword::AdGroupNegativeKeywords.archived(@ad_group_negative_keyword.first["keywordId"])
      expect(ad_group_negative_keyword["code"]).to include('SUCCESS')
    end

    it 'get AdGroupNegativeKeywords' do
      ad_group_negative_keyword = AmazonAdvertisingApiRuby::Keyword::AdGroupNegativeKeywords.retrieve(@ad_group_negative_keyword.first["keywordId"])
      expect(ad_group_negative_keyword["keywordId"]).not_to be nil
    end

    it 'get AdGroupNegativeKeywords extended ' do
      ad_group_negative_keyword = AmazonAdvertisingApiRuby::Keyword::AdGroupNegativeKeywords.get_extended(@ad_group_negative_keyword.first["keywordId"])
      expect(ad_group_negative_keyword["keywordId"]).not_to be nil
    end

    it 'update AdGroupBiddableKeywords' do
      ad_group_negative_keyword = AmazonAdvertisingApiRuby::Keyword::AdGroupNegativeKeywords.update({
       "keywordId" => @ad_group_negative_keyword.first["keywordId"],
       "state" => "paused",
        })
      expect(ad_group_negative_keyword[0]["code"]).to include('SUCCESS')
    end


  end
end

