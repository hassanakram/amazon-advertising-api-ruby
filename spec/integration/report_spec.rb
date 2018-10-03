require "spec_helper"

RSpec.describe AmazonAdvertisingApiRuby::Report do

  describe "#create" do
    context "given a keywords recordType" do
      it "returns a keywords report" do

        payload_response = AmazonAdvertisingApiRuby::Report.create(
            {
                "recordType" => "keywords",
                "campaignType" => "sponsoredProducts",
                "reportDate" => (Time.now - 2592000).strftime('%Y%m%d'),
                "metrics" => "impressions,clicks",
                "segment" => "query"
            }
        )

        expect(payload_response).not_to be nil
        sleep(10)
        status = AmazonAdvertisingApiRuby::Report.retrieve(payload_response["reportId"])
        if status && status["location"]
          report = AmazonAdvertisingApiRuby::Report.download(status["location"], recordType: 'keywords')
          expect(report).not_to be nil
        end

      end
    end

  end

end
