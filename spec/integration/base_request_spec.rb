require "spec_helper"

RSpec.describe AmazonAdvertisingApiRuby::BaseRequest do
  before (:all) do
    set_configurations
  end

  it "returns response " do
    response = AmazonAdvertisingApiRuby::BaseRequest.send_request('/api/v1/profile')
    expect(response).not_to be nil

  end

end
