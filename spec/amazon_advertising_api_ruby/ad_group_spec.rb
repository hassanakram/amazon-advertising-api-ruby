require "spec_helper"

RSpec.describe AmazonAdvertisingApiRuby::AdGroup do
  include_context "shared setup"

  describe "AdGroup crud operations" do

    before (:each) do
      @adGroups = AmazonAdvertisingApiRuby::AdGroup.create({
        "name" => "xyz",
        "campaignId" => 232518632675541,
        "state" => "enabled",
        "defaultBid" => 0.5,
       })
    end

    it 'Create AdGroup' do
      expect(@adGroups).not_to be nil
    end

    it 'update AdGroup' do
      adGroups = AmazonAdvertisingApiRuby::AdGroup.update({
       "adGroupId" => @adGroups.first["adGroupId"],
       "name" => "Updated",
       "state" => "paused",
       "defaultBid" => 0.8
        })
      expect(adGroups[0]["code"]).to include('SUCCESS')
    end

    it 'list AdGroup' do
      ad_group = AmazonAdvertisingApiRuby::AdGroup.list()
      expect(ad_group).not_to be nil
    end

    it 'archived AdGroup' do
      ad_group = AmazonAdvertisingApiRuby::AdGroup.archived(@adGroups.first["adGroupId"])
      expect(ad_group).not_to be nil
    end

    it 'get AdGroup' do
      ad_group = AmazonAdvertisingApiRuby::AdGroup.retrieve(@adGroups.first["adGroupId"])
      expect(ad_group).not_to be nil
    end

    it 'get AdGroup extended ' do
      ad_group = AmazonAdvertisingApiRuby::AdGroup.get_extended(@adGroups.first["adGroupId"])
      expect(ad_group).not_to be nil
    end

  end
end

