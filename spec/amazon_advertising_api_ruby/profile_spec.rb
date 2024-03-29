require "spec_helper"

RSpec.describe AmazonAdvertisingApiRuby::Profile do
  include_context "shared setup"

  describe "#list" do
    it "returns profiles" do
      profiles = AmazonAdvertisingApiRuby::Profile.list()
      profile_ids_not_nil(profiles, "profileId")
    end

    it "register profiles" do
      profile = AmazonAdvertisingApiRuby::Profile.register
      profile_id = profile["registerProfileId"] || profile["profileId"]
      expect(profile_id).not_to be nil
    end

    it "create profile" do
      profile = AmazonAdvertisingApiRuby::Profile.create
      expect(profile["profileId"]).not_to be nil
    end

    it "get profile" do
      profile = AmazonAdvertisingApiRuby::Profile.retrieve(AmazonAdvertisingApiRuby.profile_id)
      expect(profile["profileId"]).not_to be nil
    end

    it 'update profile' do
      profile = AmazonAdvertisingApiRuby::Profile.update({
        "profileId" => AmazonAdvertisingApiRuby.profile_id,
        "dailyBudget" => "8.5"
      })
        expect(profile[0]["code"]).to include('SUCCESS')
    end
  end

  def profile_ids_not_nil(profiles, key)
    expect(profiles).not_to be nil
    profiles.each do |p|
      AmazonAdvertisingApiRuby.profile_id = p["#{key}"]
      expect(p["#{key}"]).not_to be nil
    end
  end

end

