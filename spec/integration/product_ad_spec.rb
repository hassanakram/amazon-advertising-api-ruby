require "spec_helper"

RSpec.describe AmazonAdvertisingApiRuby::ProductAd do

  describe "AdGroup crud operations" do

    before (:each) do
      @product_ad = AmazonAdvertisingApiRuby::ProductAd.create({
                                                               "campaignId" => 271182162872261,
                                                               "adGroupId" => 275342011526335,
                                                               "SKU" => "32",
                                                               "state" => "enabled"
                                                           })
    end

    it 'Create ProductAd' do
      expect(@product_ad[0]["code"]).to include('SUCCESS')
    end

    it 'list ProductAd' do
      product_ad = AmazonAdvertisingApiRuby::ProductAd.list()
      expect(product_ad.count).to be >= 1
    end

    it 'archived ProductAd' do
      product_ad = AmazonAdvertisingApiRuby::ProductAd.archived(@product_ad.first["productAdId"])
      expect(product_ad["code"]).to include('SUCCESS')
    end

    it 'get ProductAd' do
      product_ad = AmazonAdvertisingApiRuby::ProductAd.retrieve(@product_ad.first["productAdId"])
      expect(product_ad["productAdId"]).not_to be nil
    end

    it 'get ProductAd extended ' do
      product_ad = AmazonAdvertisingApiRuby::ProductAd.get_extended(@product_ad.first["productAdId"])
      expect(product_ad["productAdId"]).not_to be nil
    end
  end
end
