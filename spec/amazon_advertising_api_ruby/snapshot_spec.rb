require "spec_helper"

RSpec.describe AmazonAdvertisingApiRuby::Snapshot do
  include_context "shared setup"

  describe "#create" do
    context "given a 'keywords' recordType" do
      xit "returns a keyword's snapshot" do

        payload_response = AmazonAdvertisingApiRuby::Snapshot.request_record_type(
          {
            "recordType" => "keywords",
            "campaignType" => "sponsoredProducts",
            "stateFilter" => "enabled,paused,archived",
          }
        )
        expect(payload_response).not_to be nil

        while (true)
          status = AmazonAdvertisingApiRuby::Snapshot.retrieve(payload_response["snapshotId"])
          break unless status["status"] == "IN_PROGRESS"
          sleep(30)
        end
        if status && status["location"]
          snapshot = AmazonAdvertisingApiRuby::Snapshot.download(status["location"], recordType: 'keywords')
          expect(snapshot).not_to be nil
        end

      end
    end

  end

end
