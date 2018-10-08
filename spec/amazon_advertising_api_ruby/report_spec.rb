require "spec_helper"

RSpec.describe AmazonAdvertisingApiRuby::Report do
  include_context "shared setup"

  describe "#create" do
    context "given a keywords recordType" do
      it "returns a keywords report" do

        payload_response = AmazonAdvertisingApiRuby::Report.request_record_type(
          {
            "recordType" => "keywords",
            "campaignType" => "sponsoredProducts",
            "reportDate" => (Time.now - 2592000).strftime('%Y%m%d'),
            "metrics" => "impressions,clicks",
            "segment" => "query"
          }
        )

        expect(payload_response).not_to be nil
        while (true)
          status = AmazonAdvertisingApiRuby::Report.retrieve(payload_response["reportId"])
          break unless status["status"] == "IN_PROGRESS"
          sleep(10)
        end

        if status && status["location"]
          response = AmazonAdvertisingApiRuby::Report.generate_data(status["location"], recordType: 'keywords')
          expect(response).to be_a(Array)
        end

      end
    end

  end

end
