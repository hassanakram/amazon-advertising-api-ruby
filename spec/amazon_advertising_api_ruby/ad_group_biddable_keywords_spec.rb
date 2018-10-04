require "spec_helper"

RSpec.describe AmazonAdvertisingApiRuby::Keyword::AdGroupBiddableKeywords do
  include_context "shared setup"

  describe "AdGroupBiddableKeywords crud operations" do

    before (:each) do
      @ad_group_bidable = AmazonAdvertisingApiRuby::Keyword::AdGroupBiddableKeywords.create({

        "campaignId" => 271182162872261,
        "adGroupId" => 275342011526335,
        "keywordText" => "32",
        "state" => "enabled",
        "matchType" => "broad",
      })
    end
    it 'Create AdGroupBiddableKeywords' do
      expect(@ad_group_bidable[0]["code"]).to include('SUCCESS')
    end

    it 'list AdGroupBiddableKeywords' do
      ad_group_bidable = AmazonAdvertisingApiRuby::Keyword::AdGroupBiddableKeywords.list()
      expect(ad_group_bidable.count).to be >= 0
    end

    it 'archived AdGroupBiddableKeywords' do
      ad_group_bidable = AmazonAdvertisingApiRuby::Keyword::AdGroupBiddableKeywords.archived(@ad_group_bidable.first["keywordId"])
      expect(ad_group_bidable["code"]).to include('SUCCESS')
    end

    it 'get AdGroupBiddableKeywords' do
      ad_group_bidable = AmazonAdvertisingApiRuby::Keyword::AdGroupBiddableKeywords.retrieve(@ad_group_bidable.first["keywordId"])
      expect(ad_group_bidable["keywordId"]).not_to be nil
    end

    it 'get AdGroupBiddableKeywords extended ' do
      ad_group_bidable = AmazonAdvertisingApiRuby::Keyword::AdGroupBiddableKeywords.get_extended(@ad_group_bidable.first["keywordId"])
      expect(ad_group_bidable["keywordId"]).not_to be nil
    end

    it 'update AdGroupBiddableKeywords' do
      ad_group_bidable = AmazonAdvertisingApiRuby::Keyword::AdGroupBiddableKeywords.update({
        "keywordId" => @ad_group_bidable.first["keywordId"],
        "state" => "paused",
        })
      expect(ad_group_bidable[0]["code"]).to include('SUCCESS')
    end


  end
end
