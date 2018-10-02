require "spec_helper"

RSpec.describe AmazonAdvertisingApiRuby::Token do
  before (:all) do
    set_configurations
  end
  it "gets a token" do
    expect(AmazonAdvertisingApiRuby.access_token).not_to be nil
  end

end
