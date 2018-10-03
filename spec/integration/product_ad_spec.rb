require "spec_helper"

RSpec.describe AmazonAdvertisingApiRuby::ProductAd do

  describe "AdGroup crud operations" do

    before (:each) do
      @product_ad = AmazonAdvertisingApiRuby::ProductAd.create({

       "campaignId" => 232518632675541,
       "adGroupId" => 58259585675226,
       "sku" => "TEST005",
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
      product_ad = AmazonAdvertisingApiRuby::ProductAd.archived(@product_ad.first["adId"])
      expect(product_ad["code"]).to include('SUCCESS')
    end

    it 'update product_ad' do
      product_ad = AmazonAdvertisingApiRuby::ProductAd.update({
         "adId" => @product_ad.first["adId"],
         "state" => "paused",
          })
      expect(product_ad[0]["code"]).to include('SUCCESS')
    end

    it 'get ProductAd' do
      product_ad = AmazonAdvertisingApiRuby::ProductAd.retrieve(@product_ad.first["adId"])
      expect(product_ad["adId"]).not_to be nil
    end

    it 'get ProductAd extended ' do
      product_ad = AmazonAdvertisingApiRuby::ProductAd.get_extended(@product_ad.first["adId"])
      expect(product_ad["adId"]).not_to be nil
    end
  end
end
