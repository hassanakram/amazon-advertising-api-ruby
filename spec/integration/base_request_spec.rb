require "spec_helper"

RSpec.describe AmazonAdvertisingApiRuby::BaseRequest do
  include_context "shared setup"
  describe "#Get Request" do
    it "returns response " do
      response = AmazonAdvertisingApiRuby::BaseRequest.get_request("https://advertising-api-test.amazon.com", opts = {})
      expect(response).not_to be nil

    end
  end
end





# RSpec.describe AmazonAdvertisingApiRuby::BaseRequest do
#   include_context "shared setup"
#

#
# end