require "spec_helper"

RSpec.describe AmazonAdvertisingApiRuby::Keyword::SuggestedKeyword do
  before (:all) do
    set_configurations
  end

  describe "suggested keywords operations" do
    it "return list of suggested keywords by ad group" do
      ad_groups = create_ad_group
      opts = {
        suggestedBy: "adGroupId"
      }
      params = {"adGroupId" => 216603266439677, "adStateFilter" => "enabled,paused,archived", "maxNumSuggestions" => 200}
      api_call(params, opts)
    end

    it "return list extended of suggested keywords by ad group" do
      ad_groups = create_ad_group
      opts = {
        suggestedBy: "adGroupIdExtended"
      }
      params = {"adGroupIdExtended" => ad_groups.first["adGroupId"], "suggestBids" => "yes"}
      api_call(params, opts)
    end

    it "return list of suggested keywords by asin" do
      opts = {
        suggestedBy: "asinValue"
      }
      params = {"asinValue" => "B06XNX32K1", "maxNumSuggestions" => "200"}
      api_call(params, opts)
    end

    it "return list of suggested keywords by asin list" do
      opts = {
        suggestedBy: "asinList"
      }
      params = {asins: ["B06XNX32K1"]}
      api_call(params, opts)
    end
  end

  def api_call(params, opts)
    payload_response = AmazonAdvertisingApiRuby::Keyword::SuggestedKeyword.list(params, opts)
    expect(payload_response).to be_a(Array)
  end

  def create_ad_group
    AmazonAdvertisingApiRuby::AdGroup.create({
      "name" => "xyz",
      "campaignId" => 232518632675541,
      "state" => "enabled",
      "defaultBid" => 0.5
    })
  end

end

