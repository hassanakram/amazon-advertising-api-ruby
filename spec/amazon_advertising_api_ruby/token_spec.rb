require "spec_helper"

RSpec.describe AmazonAdvertisingApiRuby::Token do
  include_context "shared setup"

  it "gets a token by refresh token" do
    expect(AmazonAdvertisingApiRuby::Token.retrieve).not_to be nil
  end

  it "returns tokens by " do
    auth_code = "ANKxXSARRipBoHxnqymk"
    expect(AmazonAdvertisingApiRuby::Token.authorize(auth_code)["refresh_token"]).not_to be nil
  end
end
