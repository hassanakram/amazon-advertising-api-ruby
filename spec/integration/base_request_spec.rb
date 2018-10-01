require "spec_helper"

RSpec.describe AmazonAdvertisingApiRuby::BaseRequest do
  include_context "shared setup"

  it "returns get response " do
    response = AmazonAdvertisingApiRuby::BaseRequest.get_request("https://advertising-api-test.amazon.com", opts = {})
    expect(response).to be nil

  end
  it "returns post response " do
    response = AmazonAdvertisingApiRuby::BaseRequest.get_request("https://advertising-api-test.amazon.com", opts = {})
    expect(response).to be nil

  end


end
