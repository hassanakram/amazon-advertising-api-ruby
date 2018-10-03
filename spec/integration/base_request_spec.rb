require "spec_helper"

RSpec.describe AmazonAdvertisingApiRuby::BaseRequest do
  include_context "shared setup"

  it "returns response " do
    response = AmazonAdvertisingApiRuby::BaseRequest.send_request('/api/v1/profile')
    expect(response).not_to be nil

  end

end
