require "spec_helper"

RSpec.describe AmazonAdvertisingApiRuby::Profile do
  include_context "shared setup"

  describe "#list" do
    it "returns profiles" do
      profiles = AmazonAdvertisingApiRuby::Profile.list()
      expect(profiles).not_to be nil

      profiles.each do | p |
        expect(AmazonAdvertisingApiRuby::Profile.retrieve(p["profileId"])).not_to be nil
      end
    end
  end

end
